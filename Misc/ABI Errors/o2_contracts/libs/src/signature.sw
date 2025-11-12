library;

use upgradability::*;
use std::{
    block::chain_id,
    codec::*,
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
    option::Option,
    string::String,
};
use ::crypto::*;

/// Event emitted when the nonce is incremented.
pub struct IncrementNonceEvent {
    /// The new nonce value after incrementing
    pub nonce: u64,
}

impl IncrementNonceEvent {
    pub fn new(nonce: u64) -> Self {
        Self { nonce }
    }

    pub fn log(self) {
        log(self);
    }
}

/// The storage slot to store the proxy owner State.
///
/// Value is `sha256("storage_nonce_1")`.
pub const CONTRACT_NONCE_STORAGE: b256 = 0xd4b8ed72683945765e02b29e2acba0e3fca374f436b06067ba1c4944de6321c2;

/// Reads the current nonce value from storage.
/// Used for replay protection in signature verification.
///
/// # Returns
///
/// * `Option<u64>` - The current nonce value, or None if not yet initialized
#[storage(read)]
pub fn read_nonce() -> Option<u64> {
    let nonce_key = StorageKey::new(CONTRACT_NONCE_STORAGE, 0, CONTRACT_NONCE_STORAGE);
    nonce_key.try_read().unwrap_or(None)
}

/// Writes a new nonce value to storage.
/// Updates the nonce for replay protection.
///
/// # Arguments
///
/// * `nonce` - The new nonce value to store
#[storage(write)]
pub fn write_nonce(nonce: u64) {
    let nonce_key = StorageKey::new(CONTRACT_NONCE_STORAGE, 0, CONTRACT_NONCE_STORAGE);
    nonce_key.write(Some(nonce));
}

/// Increments the nonce and returns the previous value.
/// Emits an IncrementNonceEvent for tracking.
///
/// # Returns
///
/// * `u64` - The nonce value before incrementing
///
/// # Events
///
/// - Emits `IncrementNonceEvent` with the new nonce value
#[storage(read, write)]
pub fn increment_nonce() -> u64 {
    let current_nonce = read_nonce().unwrap_or(0);
    write_nonce(current_nonce + 1);
    IncrementNonceEvent::new(current_nonce + 1).log();
    current_nonce
}

/// Verifies that the caller is the proxy owner, either directly or via signature.
/// Supports both direct calls and signature-based authorization.
///
/// # Arguments
///
/// * `signature` - Optional signature for authorization
/// * `args` - The arguments that were signed (must match the signature)
///
/// # Returns
///
/// * `Result<Identity, SignatureError>` - The proxy owner identity if authorized
///
/// # Security
///
/// - If signature provided: Verifies signature against proxy owner address with nonce
/// - If no signature: Checks that msg_sender is the proxy owner
/// - Uses nonce to prevent replay attacks
///
/// # Reverts
///
/// - If signature is invalid
/// - If caller is not the proxy owner (when no signature)
#[storage(read, write)]
pub fn only_proxy_owner_with_signature<T>(
    signature: Option<Signature>,
    f_name: String,
    args: T,
) -> Result<Identity, SignatureError>
where
    T: AbiEncode,
{
    let proxy_owner = _proxy_owner().owner().unwrap();
    match signature {
        Some(signature) => {
            if let Identity::Address(proxy_owner_address) = proxy_owner
            {
                let nonce = increment_nonce();
                require(
                    verify_address(
                        proxy_owner_address,
                        signature,
                        (nonce, chain_id(), f_name, args),
                    ),
                    "Caller is not the proxy owner",
                );
                return Ok(proxy_owner);
            }
            return Err(SignatureError::InvalidSignature);
        },
        None => {
            require(
                proxy_owner == msg_sender()
                    .unwrap(),
                "Caller is not the proxy owner",
            );
        }
    };
    Ok(proxy_owner)
}
