library;

use std::crypto::signature::Signature;
use std::time::Time;

/// Event emitted when ownership of the trading account is transferred.
/// Tracks the complete ownership transfer history.
pub struct OwnershipTransferredEvent {
    /// The previous owner of the account
    pub previous_owner: Option<Identity>,
    /// The new owner of the account
    pub new_owner: Identity,
    /// Unix timestamp of the ownership transfer
    pub timestamp: Time,
}

impl OwnershipTransferredEvent {
    pub fn new(previous_owner: Option<Identity>, new_owner: Identity) -> Self {
        Self {
            previous_owner,
            new_owner,
            timestamp: Time::now(),
        }
    }

    pub fn log(self) {
        log(self);
    }
}

/// Proxy contract ABI for trading accounts.
/// Provides upgradeability and ownership management for trading account contracts.
abi TradeAccountProxy {
    /// Initializes the proxy contract.
    /// Sets up initial storage values and prepares the proxy for use.
    ///
    /// # Storage Access
    ///
    /// - Writes: Initial proxy configuration and owner state
    ///
    /// # Security
    ///
    /// - Can only be called once during contract deployment
    /// - Fetches initial implementation from oracle
    ///
    /// # Reverts
    ///
    /// - If already initialized
    /// - If oracle returns invalid implementation
    #[storage(write)]
    fn initialize();

    /// Checks if an upgrade is available for this trading account.
    /// Queries the oracle contract for any pending upgrades.
    ///
    /// # Returns
    ///
    /// * `Option<ContractId>` - The new implementation contract ID if upgrade is available, None otherwise
    ///
    /// # Storage Access
    ///
    /// - Reads: Oracle contract ID from configurables
    ///
    /// # External Calls
    ///
    /// - Calls the oracle contract to check for upgrades
    #[storage(read)]
    fn check_upgrade() -> Option<ContractId>;

    /// Change the target contract of the proxy contract.
    ///
    /// # Additional Information
    ///
    /// This method can only be called by the `proxy_owner`.
    ///
    /// # Arguments
    ///
    /// * `new_target`: [ContractId] - The new proxy contract to which all fallback calls will be passed.
    ///
    /// # Reverts
    ///
    /// * When not called by `proxy_owner`.
    ///
    /// # Number of Storage Accesses
    ///
    /// * Reads: `1`
    /// * Write: `1`
    #[storage(read, write)]
    fn set_proxy_target_with_signature(signature: Option<Signature>);
}

/// Proxy contract ABI for order book contracts.
/// Provides upgradeability and ownership management for order book contracts.
abi OrderbookProxy {
    /// Initializes the order book proxy contract.
    /// Sets up initial storage values and prepares the proxy for use.
    ///
    /// # Storage Access
    ///
    /// - Writes: Initial proxy configuration and owner state
    ///
    /// # Security
    ///
    /// - Can only be called once during contract deployment
    ///
    /// # Reverts
    ///
    /// - If already initialized
    #[storage(write)]
    fn initialize_proxy();

    /// Sets or transfers ownership of the orderbook.
    /// Can be called during initial setup or later by the current owner to transfer ownership.
    ///
    /// # Arguments
    ///
    /// * `new_owner` - The Identity that will own and control this orderbook
    ///
    /// # Storage Access
    ///
    /// - Reads: Checks if account has a current owner (for permission validation)
    /// - Writes: Updates the owner of the account
    ///
    /// # Security
    ///
    /// - On first call (no owner set): Anyone can set the initial owner
    /// - On subsequent calls: Only the current owner can transfer ownership
    ///
    /// # Events
    ///
    /// - Emits `OwnershipTransferredEvent` with previous and new owner details
    ///
    /// # Reverts
    ///
    /// - If caller is not the current owner (when owner already exists)
    /// - If the new owner is a zero address
    /// - If the new owner is the same as current owner
    #[storage(read, write)]
    fn set_owner(new_owner: Identity);
}

/// Proxy contract ABI for the register contract.
/// Provides upgradeability and ownership management for the register contract.
abi RegisterProxy {
    /// Initializes the register proxy contract.
    /// Sets up initial storage values and prepares the proxy for use.
    ///
    /// # Storage Access
    ///
    /// - Writes: Initial proxy configuration and owner state
    ///
    /// # Security
    ///
    /// - Can only be called once during contract deployment
    ///
    /// # Reverts
    ///
    /// - If already initialized
    #[storage(write)]
    fn initialize_proxy();

    /// Sets or transfers ownership of the register.
    /// Can be called during initial setup or later by the current owner to transfer ownership.
    ///
    /// # Arguments
    ///
    /// * `new_owner` - The Identity that will own and control this register
    ///
    /// # Storage Access
    ///
    /// - Reads: Checks if account has a current owner (for permission validation)
    /// - Writes: Updates the owner of the account
    ///
    /// # Security
    ///
    /// - On first call (no owner set): Anyone can set the initial owner
    /// - On subsequent calls: Only the current owner can transfer ownership
    ///
    /// # Events
    ///
    /// - Emits `OwnershipTransferredEvent` with previous and new owner details
    ///
    /// # Reverts
    ///
    /// - If caller is not the current owner (when owner already exists)
    /// - If the new owner is a zero address
    /// - If the new owner is the same as current owner
    #[storage(read, write)]
    fn set_owner(new_owner: Identity);
}
