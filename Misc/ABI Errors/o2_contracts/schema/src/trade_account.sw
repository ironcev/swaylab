library;

use std::{
    b512::B512,
    bytes::Bytes,
    crypto::signature::Signature,
    hash::{
        Hash,
        Hasher,
    },
    identity::Identity,
    low_level_call::CallParams,
    option::Option,
    string::String,
    time::Time,
};

// Type Aliases

/// Represents a session identity that can perform delegated operations
pub type SessionId = Identity;

// Structs

/// Represents a trading session with delegated access.
/// Sessions allow temporary access to trading functions without exposing main keys.
pub struct Session {
    /// Whether the session is currently active
    pub session_id: SessionId,
    /// Unix timestamp when the session expires
    pub expiry: Time,
    /// A list of contracts that the session is allowed to interact with
    pub contract_ids: Vec<ContractId>,
}

impl Hash for Session {
    fn hash(self, ref mut state: Hasher) {
        self.session_id.hash(state);
        self.expiry.hash(state);
        self.contract_ids.hash(state);
    }
}

impl Session {
    pub fn new() -> Self {
        Self {
            session_id: Identity::Address(Address::zero()),
            expiry: Time::new(0),
            contract_ids: Vec::new(),
        }
    }
}

// Events for Trading Account

/// Event emitted when assets are withdrawn from the trading account.
pub struct WithdrawEvent {
    /// The account making the withdrawal
    pub account: Identity,
    /// The recipient of the withdrawal
    pub to: Identity,
    /// Amount withdrawn
    pub amount: u64,
    /// Asset type withdrawn
    pub asset_id: AssetId,
    /// Unix timestamp of the withdrawal
    pub timestamp: Time,
}

impl WithdrawEvent {
    pub fn new(
        account: Identity,
        to: Identity,
        amount: u64,
        asset_id: AssetId,
    ) -> Self {
        Self {
            account,
            to,
            amount,
            asset_id,
            timestamp: Time::now(),
        }
    }

    pub fn log(self) {
        log(self);
    }
}

/// Event emitted when another contract is called via a session.
pub struct SessionContractCallEvent {
    /// The session id that called the contract.
    pub session_id: SessionId,
    /// The contract that was called.
    pub called_contract: ContractId,
    /// The nonce that has been used.
    pub nonce: u64,
}

impl SessionContractCallEvent {
    pub fn new(
        session_id: SessionId,
        called_contract: ContractId,
        nonce: u64,
    ) -> Self {
        Self {
            nonce,
            session_id,
            called_contract,
        }
    }

    pub fn log(self) {
        log(self);
    }
}

/// Arguments for executing a contract call through the trading account.
/// Encapsulates all parameters needed for a cross-contract invocation.
pub struct CallContractArg {
    /// The target contract to call
    pub contract_id: ContractId,
    /// The function selector identifying which method to call
    pub function_selector: Bytes,
    /// Call parameters including gas, coins, and asset_id
    pub call_params: CallParams,
    /// Optional encoded arguments for the function call
    pub call_data: Option<Bytes>,
}

/// Event emitted when a new session is created.
pub struct SessionCreatedEvent {
    /// The account that created the session
    pub account: Identity,
    /// The information about this new session.
    pub session: Session,
}

impl SessionCreatedEvent {
    pub fn new(account: Identity, session: Session) -> Self {
        Self {
            account,
            session,
        }
    }

    pub fn log(self) {
        log(self);
    }
}

/// Event emitted when a session is revoked.
pub struct SessionRevokedEvent {
    /// The account that revoked the session
    pub account: Identity,
    /// The identity of the revoked session
    pub session_id: SessionId,
}

impl SessionRevokedEvent {
    pub fn new(account: Identity, session_id: SessionId) -> Self {
        Self {
            account,
            session_id,
        }
    }

    pub fn log(self) {
        log(self);
    }
}

/// Event emitted when session validation fails.
/// Used for security monitoring and debugging.
pub struct FailedToValidateEvent {
    /// The account where validation failed
    pub account: Identity,
    /// Human-readable reason for the validation failure
    pub reason: String,
    /// Unix timestamp of the failed validation
    pub timestamp: Time,
}

impl FailedToValidateEvent {
    pub fn new(account: Identity, reason: String) -> Self {
        Self {
            account,
            reason,
            timestamp: Time::now(),
        }
    }

    pub fn log(self) {
        log(self);
    }
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
abi TradingAccount {
    /// Sets a new session identity for delegated operations.
    /// Only one session can be active at a time - setting a new session automatically revokes any existing session.
    /// Sessions allow temporary access to trading functions without exposing the owner's keys.
    ///
    /// # Arguments
    ///
    /// * `session` - The new session to make active.
    ///
    /// # Storage Access
    ///
    /// - Reads: Verifies caller is the account owner
    /// - Writes: Replaces any existing session with the new one
    ///
    /// # Events
    ///
    /// - Emits `SessionRevokedEvent` if a previous session existed
    /// - Emits `SessionCreatedEvent` if new session_id is non-zero
    ///
    /// # Security
    ///
    /// - Automatically revokes any existing session before creating the new one
    /// - Only one session can be active per account at any time
    /// - Pass zero address Identity to revoke without setting a new session
    ///
    /// # Reverts
    ///
    /// - If caller is not the account owner
    /// - If expiry is in the past (when session_id is non-zero)
    #[storage(read, write)]
    fn set_session(signature: Option<Signature>, session: Option<Session>);

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
    fn validate_session(session_id: SessionId) -> bool;

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
    fn get_current_session() -> Option<Session>;

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
    );

    /// Executes a call to another contract on behalf of the trading account via the trading account owner.
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
    fn call_contract(signature: Option<Signature>, call: CallContractArg);

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
    fn call_contracts(signature: Option<Signature>, calls: Vec<CallContractArg>);

    /// Executes a call to another contract on behalf of the trading account via the session.
    /// Allows the account to interact with other contracts (e.g., order books).
    ///
    /// # Arguments
    ///
    /// * `signature` - The signed message by the trading account owner
    /// * `contract_id` - The contract to call
    /// * `function_selector` - The function in the contract to call
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
    /// - If caller is not a valid session
    /// - If insufficient balance for forwarded assets
    /// - If external call fails
    #[storage(read, write)]
    fn session_call_contract(signature: Signature, call: CallContractArg);

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
    fn session_call_contracts(signature: Signature, calls: Vec<CallContractArg>);

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
    fn get_nonce() -> u64;
}
