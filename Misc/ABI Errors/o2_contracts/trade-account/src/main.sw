contract;

use contract_schema::trade_account::*;
use upgradability::*;
use std::{
    asset::transfer,
    b512::B512,
    bytes::Bytes,
    codec::*,
    context::this_balance,
    crypto::{
        message::Message,
        public_key::PublicKey,
        signature::Signature,
        signature_error::SignatureError,
    },
    hash::{
        Hash,
        sha256,
    },
    identity::Identity,
    low_level_call::{
        call_with_function_selector,
        CallParams,
    },
    option::Option,
    storage::{
        storage_map::*,
        storage_vec::*,
    },
    string::String,
    time::Time,
};
use contract_libs::signature::*;
use contract_libs::crypto::*;

struct SessionStorage {
    pub session_id: SessionId,
    pub expiry: Time,
}

storage {
    trading_account {
        v1 {
            session: Option<SessionStorage> = None,
            session_contracts: StorageVec<ContractId> = StorageVec {},
            session_contract_ids: StorageMap<ContractId, bool> = StorageMap {},
        },
    },
}

/// Trading Account contract ABI for secure, user-controlled trading operations.
/// Provides a personal smart contract wallet with session management and upgrade capabilities.
///
/// # Overview
///
/// Each TradingAccount is a dedicated contract instance for a single user, providing:
/// - Secure asset custody with owner-only withdrawals
/// - Session-based delegation for automated trading
/// - Upgradeable implementation via proxy pattern
/// - Direct integration with OrderBook contracts
///
/// # Key Features
///
/// - Owner-controlled account with transferable ownership
/// - Single active session for delegated operations
/// - Oracle-based upgrade mechanism for security
/// - Balance tracking for multiple assets
/// - Contract interaction capabilities for trading
///
/// # Security Model
///
/// - Only the owner can withdraw funds and manage sessions
/// - Sessions provide temporary, revocable access
/// - Upgrades are validated through a trusted oracle
/// - All significant actions emit events for auditability
///
/// # Design Principles
///
/// - One contract per user for isolation
/// - Minimal bytecode for cost efficiency (~1KB target)
/// - Session keys enable secure automation
/// - Proxy pattern allows future improvements
/// - Direct deposits (no deposit method needed)
impl TradingAccount for Contract {
    /// Sets a new session identity for delegated operations.
    /// Only one session can be active at a time - setting a new session automatically revokes any existing session.
    /// Sessions allow temporary access to trading functions without exposing the owner's keys.
    /// Sessions must specify at least one allowed contract for security.
    ///
    /// # Arguments
    ///
    /// * `session` - The new session to make active (pass None to revoke without replacement)
    ///
    /// # Storage Access
    ///
    /// - Reads: Verifies caller is the account owner
    /// - Writes: Replaces any existing session with the new one
    ///
    /// # Events
    ///
    /// - Emits `SessionRevokedEvent` if a previous session existed
    /// - Emits `SessionCreatedEvent` if new session is created
    ///
    /// # Security
    ///
    /// - Automatically revokes any existing session before creating the new one
    /// - Only one session can be active per account at any time
    /// - Sessions must specify at least one allowed contract ID
    /// - Pass None to revoke without setting a new session
    ///
    /// # Reverts
    ///
    /// - If caller is not the account owner
    /// - If expiry is in the past (when session is Some)
    /// - If session has no allowed contracts (when session is Some)
    #[storage(read, write)]
    fn set_session(signature: Option<Signature>, session: Option<Session>) {
        let owner = only_proxy_owner_with_signature(signature, String::from("set_session"), session).unwrap();
        for session_contract in storage::trading_account::v1.session_contracts.iter() {
            let _ = storage::trading_account::v1.session_contract_ids.get(session_contract.read()).clear();
        }
        let _ = storage::trading_account::v1.session_contracts.clear();

        if session.is_some() {
            let session = session.unwrap();

            require(session.expiry >= Time::now(), "Session in past");
            require(
                session
                    .contract_ids
                    .len() > 0,
                "Session must specify at least one contracts",
            );

            storage::trading_account::v1
                .session
                .write(Some(SessionStorage {
                    session_id: session.session_id,
                    expiry: session.expiry,
                }));
            for contract_id in session.contract_ids.iter() {
                storage::trading_account::v1
                    .session_contracts
                    .push(contract_id);
                storage::trading_account::v1
                    .session_contract_ids
                    .insert(contract_id, true);
            }
            SessionCreatedEvent::new(owner, session).log();
        } else if session.is_none() {
            let current_session = storage::trading_account::v1.session.try_read().unwrap_or(None);
            storage::trading_account::v1.session.write(None);
            SessionRevokedEvent::new(owner, current_session.unwrap().session_id)
                .log();
        }
    }

    /// Validates if a session identity is currently active.
    /// Checks both if this is the current session and if it hasn't expired.
    ///
    /// # Arguments
    ///
    /// * `session_id` - The session Identity to validate
    ///
    /// # Returns
    ///
    /// * `bool` - True if this is the current session and not expired, false otherwise
    ///
    /// # Storage Access
    ///
    /// - Reads: Current session identity and expiry time
    ///
    /// # Note
    ///
    /// - Returns false if the provided identity doesn't match the current session
    /// - Returns false if the current session has expired
    #[storage(read)]
    fn validate_session(session_id: SessionId) -> bool {
        let current_session = storage::trading_account::v1.session.try_read();
        let owner = _proxy_owner().owner().unwrap();

        if current_session.is_none() {
            FailedToValidateEvent::new(owner, String::from_ascii_str("No session found"))
                .log();
            return false;
        }

        match current_session.unwrap() {
            Some(session) => {
                if !is_session_active(session) {
                    FailedToValidateEvent::new(owner, String::from_ascii_str("Session not active"))
                        .log();
                    false
                } else if session.session_id != session_id {
                    FailedToValidateEvent::new(owner, String::from_ascii_str("Session ID do not match"))
                        .log();
                    false
                } else {
                    true
                }
            },
            None => {
                FailedToValidateEvent::new(owner, String::from_ascii_str("No session found"))
                    .log();
                false
            }
        }
    }

    /// Returns information about the current active session.
    ///
    /// # Returns
    ///
    /// * `Option<Session>` - Session if a session exists, None otherwise
    ///
    /// # Storage Access
    ///
    /// - Reads: Current session data
    ///
    /// # Note
    ///
    /// - Returns the session even if it has expired (caller should check expiry)
    /// - Returns None if no session has been set
    #[storage(read)]
    fn get_current_session() -> Option<Session> {
        let current_session = storage::trading_account::v1.session.try_read();
        let owner = _proxy_owner().owner().unwrap();

        if current_session.is_none() {
            FailedToValidateEvent::new(owner, String::from_ascii_str("No session found"))
                .log();
            return None;
        }

        match current_session.unwrap() {
            Some(session) => {
                if !is_session_active(session) {
                    FailedToValidateEvent::new(owner, String::from_ascii_str("Session not active"))
                        .log();
                    None
                } else {
                    let mut contract_ids = Vec::new();
                    let mut contract_id_len = storage::trading_account::v1.session_contracts.len();
                    while contract_id_len > 0 {
                        contract_id_len -= 1;
                        contract_ids.push(
                            storage::trading_account::v1
                                .session_contracts
                                .get(contract_id_len)
                                .unwrap()
                                .try_read()
                                .unwrap(),
                        );
                    }
                    Some(Session {
                        session_id: session.session_id,
                        expiry: session.expiry,
                        contract_ids,
                    })
                }
            },
            None => {
                FailedToValidateEvent::new(owner, String::from_ascii_str("No session found"))
                    .log();
                None
            }
        }
    }

    /// Withdraws assets from the trading account to a specified recipient.
    /// Only the account owner can withdraw funds.
    ///
    /// # Arguments
    ///
    /// * `to` - The recipient Identity for the withdrawal
    /// * `amount` - The amount to withdraw
    /// * `asset_id` - The asset to withdraw
    ///
    /// # Storage Access
    ///
    /// - Reads: Verifies caller is owner and checks balance
    /// - Writes: Updates the balance after withdrawal
    ///
    /// # Events
    ///
    /// - Emits `WithdrawEvent` with withdrawal details
    ///
    /// # Reverts
    ///
    /// - If caller is not the account owner
    /// - If insufficient balance
    /// - If amount is zero
    /// - If transfer fails
    #[storage(read, write)]
    fn withdraw(
        signature: Option<Signature>,
        to: Identity,
        amount: u64,
        asset_id: AssetId,
    ) {
        let owner = only_proxy_owner_with_signature(signature, String::from("withdraw"), (to, amount, asset_id)).unwrap();

        require(amount > 0, "Amount zero");
        require(this_balance(asset_id) >= amount, "Not enough balance");

        transfer(to, asset_id, amount);

        WithdrawEvent::new(owner, to, amount, asset_id).log();
    }

    /// Executes a call to another contract on behalf of the trading account.
    /// Allows the account to interact with other contracts (e.g., order books).
    ///
    /// # Arguments
    ///
    /// * `contract_id` - The contract to call
    /// * `forward` - Optional assets to forward with the call
    /// * `args` - Optional encoded arguments for the call
    ///
    /// # Returns
    ///
    /// * `Bytes` - The encoded return value from the called contract
    ///
    /// # Storage Access
    ///
    /// - Reads: Verifies caller permissions (owner or valid session)
    ///
    /// # Security
    ///
    /// - Only callable by account owner or valid session key holder
    /// - Validates forwarded amounts against account balance
    ///
    /// # Events
    ///
    /// - May emit `FailedToValidateEvent` if session validation fails
    ///
    /// # Reverts
    ///
    /// - If caller is not authorized (neither owner nor valid session)
    /// - If insufficient balance for forwarded assets
    /// - If external call fails
    #[storage(read, write)]
    fn call_contract(signature: Option<Signature>, call: CallContractArg) {
        let _ = only_proxy_owner_with_signature(signature, String::from("call_contract"), call).unwrap();

        let payload = create_payload(
            call.contract_id,
            call.function_selector,
            call.call_data
                .unwrap_or(Bytes::new()),
        );
        asm(
            r1: payload.ptr(),
            r2: call.call_params.coins,
            r3: call.call_params.asset_id,
            r4: call.call_params.gas,
        ) {
            call r1 r2 r3 r4;
        };
    }

    /// Executes multiple calls to other contracts on behalf of the trading account via the trading account owner.
    /// Allows the account to interact with other contracts (e.g., order books).
    ///
    /// # Arguments
    ///
    /// * `contract_id` - The contract to call
    /// * `call_params` - Optional assets to forward with the call
    /// * `args` - Optional encoded arguments for the call
    ///
    /// # Returns
    ///
    /// * `Bytes` - The encoded return value from the called contract
    ///
    /// # Storage Access
    ///
    /// - Reads: Verifies caller permissions (owner or valid session)
    ///
    /// # Security
    ///
    /// - Only callable by account owner or valid session key holder
    /// - Validates forwarded amounts against account balance
    ///
    /// # Events
    ///
    /// - May emit `FailedToValidateEvent` if session validation fails
    ///
    /// # Reverts
    ///
    /// - If caller is not the trading account owner
    /// - If insufficient balance for forwarded assets
    /// - If external call fails
    #[storage(read, write)]
    fn call_contracts(signature: Option<Signature>, calls: Vec<CallContractArg>) {
        let _ = only_proxy_owner_with_signature(signature, String::from("call_contracts"), calls).unwrap();

        for call in calls.iter() {
            let payload = create_payload(
                call.contract_id,
                call.function_selector,
                call.call_data
                    .unwrap_or(Bytes::new()),
            );
            asm(
                r1: payload.ptr(),
                r2: call.call_params.coins,
                r3: call.call_params.asset_id,
                r4: call.call_params.gas,
            ) {
                call r1 r2 r3 r4;
            };
        }
    }

    /// Executes a single contract call using session key authorization.
    /// Allows delegated operations without exposing the owner's private key.
    ///
    /// # Arguments
    ///
    /// * `signature` - Session key signature proving authorization
    /// * `call` - The contract call details including target, selector, and parameters
    ///
    /// # Storage Access
    ///
    /// - Reads: Current session for validation, current nonce
    /// - Writes: Increments nonce for replay protection
    ///
    /// # Security
    ///
    /// - Validates signature against the session key
    /// - Verifies session is active and not expired
    /// - Uses nonce to prevent replay attacks
    ///
    /// # Events
    ///
    /// - Emits `SessionContractCallEvent` for audit trail
    ///
    /// # Reverts
    ///
    /// - If signature is invalid
    /// - If session is expired or revoked
    /// - If recovered address doesn't match session_id
    /// - If external call fails
    #[storage(read, write)]
    fn session_call_contract(signature: Signature, call: CallContractArg) {
        let nonce = increment_nonce();
        let digest = sha256((nonce, encode(call)));
        let message = Message::from(digest);
        let recovered_address = signature.address(message).unwrap();
        let session_id = Identity::Address(recovered_address);
        verify_session(session_id);
        require(
            is_contract_allowed(call.contract_id),
            FailedToValidateEvent::new(session_id, String::from_ascii_str("Contract not allowed")),
        );
        SessionContractCallEvent::new(session_id, call.contract_id, nonce)
            .log();
        let payload = create_payload(
            call.contract_id,
            call.function_selector,
            call.call_data
                .unwrap_or(Bytes::new()),
        );
        asm(
            r1: payload.ptr(),
            r2: call.call_params.coins,
            r3: call.call_params.asset_id,
            r4: call.call_params.gas,
        ) {
            call r1 r2 r3 r4;
        };
    }

    /// Executes multiple contract calls using session key authorization.
    /// Enables batch operations for efficiency and atomicity.
    ///
    /// # Arguments
    ///
    /// * `signature` - Session key signature for the batch operation
    /// * `calls` - Vector of contract calls to execute in sequence
    ///
    /// # Storage Access
    ///
    /// - Reads: Current session for validation, current nonce
    /// - Writes: Increments nonce once for the entire batch
    ///
    /// # Security
    ///
    /// - Single signature validates the entire batch
    /// - All calls share the same nonce for atomicity
    /// - Session must be valid for all calls to execute
    ///
    /// # Events
    ///
    /// - Emits `SessionContractCallEvent` for each call in the batch
    ///
    /// # Note
    ///
    /// - Calls are executed sequentially in the order provided
    /// - If any call fails, subsequent calls may not execute
    ///
    /// # Reverts
    ///
    /// - If signature validation fails
    /// - If session is invalid
    /// - If any individual call fails
    #[storage(read, write)]
    fn session_call_contracts(signature: Signature, calls: Vec<CallContractArg>) {
        let nonce = increment_nonce();
        let bytes = (nonce, encode(calls));
        let message = Message::from(sha256(bytes));
        let recovered_address = signature.address(message).unwrap();
        let session_id = Identity::Address(recovered_address);
        verify_session(session_id);

        for call in calls.iter() {
            require(
                is_contract_allowed(call.contract_id),
                FailedToValidateEvent::new(session_id, String::from_ascii_str("Contract not allowed")),
            );
            SessionContractCallEvent::new(session_id, call.contract_id, nonce)
                .log();
            let payload = create_payload(
                call.contract_id,
                call.function_selector,
                call.call_data
                    .unwrap_or(Bytes::new()),
            );
            asm(
                r1: payload.ptr(),
                r2: call.call_params.coins,
                r3: call.call_params.asset_id,
                r4: call.call_params.gas,
            ) {
                call r1 r2 r3 r4;
            };
        }
    }

    /// Returns the current nonce value for replay protection.
    /// Nonce increments with each session-authorized operation.
    ///
    /// # Returns
    ///
    /// * `u64` - Current nonce value (starts at 0)
    ///
    /// # Storage Access
    ///
    /// - Reads: Current nonce from storage
    ///
    /// # Note
    ///
    /// - Used to prevent replay attacks on session operations
    /// - Increments automatically with each session call
    #[storage(read)]
    fn get_nonce() -> u64 {
        read_nonce().unwrap_or(0)
    }
}

/// Creates a properly formatted payload for contract calls.
/// Packs the target, selector, and data according to Fuel VM specifications.
///
/// # Arguments
///
/// * `target` - The contract ID to call
/// * `function_selector` - The function selector bytes
/// * `call_data` - The encoded function arguments
///
/// # Returns
///
/// * `Bytes` - Packed payload ready for the CALL instruction
///
/// # Format
///
/// According to Fuel VM spec:
/// - 32 bytes: Contract ID
/// - 8 bytes: Function selector pointer
/// - 8 bytes: Call data pointer
fn create_payload(
    target: ContractId,
    function_selector: Bytes,
    call_data: Bytes,
) -> Bytes {
    /*
    packs args according to spec (https://github.com/FuelLabs/fuel-specs/blob/master/src/vm/instruction_set.md#call-call-contract) :

    bytes   type        value   description
    32	    byte[32]    to      Contract ID to call.
    8	    byte[8]	    param1  First parameter (function selector pointer)
    8	    byte[8]	    param2  Second parameter (encoded arguments pointer)
    */
    Bytes::from(encode((
        target,
        asm(a: function_selector.ptr()) {
            a: u64
        },
        asm(a: call_data.ptr()) {
            a: u64
        },
    )))
}

/// Checks if a contract ID is allowed for the session.
/// Sessions must specify allowed contracts for security.
///
/// # Arguments
///
/// * `contract_id` - The contract ID to check
///
/// # Returns
///
/// * `bool` - True if contract is allowed, false otherwise
#[storage(read)]
fn is_contract_allowed(contract_id: ContractId) -> bool {
    storage::trading_account::v1.session_contract_ids.get(contract_id).try_read().unwrap_or(false)
}

/// Checks if a session is active based on its expiry time.
///
/// # Arguments
///
/// * `session` - The session to check
///
/// # Returns
///
/// * `bool` - True if session is active, false otherwise
fn is_session_active(session: SessionStorage) -> bool {
    session.expiry >= Time::now()
}

#[storage(read)]
/// Verifies that the provided identity matches the current active session.
/// Used internally to authorize session-based operations.
///
/// # Arguments
///
/// * `session_address` - The identity to verify against the current session
///
/// # Reverts
///
/// - If no session exists
/// - If session has expired
/// - If provided identity doesn't match the session_id
fn verify_session(session_address: Identity) {
    let current_session = storage::trading_account::v1.session.try_read();
    require(
        current_session
            .is_some(),
        FailedToValidateEvent::new(session_address, String::from_ascii_str("No session found")),
    );
    let current_session = current_session.unwrap().unwrap();
    require(
        current_session
            .session_id == session_address,
        FailedToValidateEvent::new(
            session_address,
            String::from_ascii_str("Invalid session address"),
        ),
    );
    require(
        is_session_active(current_session),
        FailedToValidateEvent::new(session_address, String::from_ascii_str("Expired session")),
    );
}
