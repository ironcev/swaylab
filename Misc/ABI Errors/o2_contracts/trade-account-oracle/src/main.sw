contract;

use contract_schema::{oracle::Oracle, trade_account::*};
use ownership::*;
use src5::*;
use pausable::*;

storage {
    trading_account_oracle {
        v1 {
            trading_account_implementation: Option<ContractId> = None,
        },
    },
}

/// Oracle contract ABI for managing approved contract implementations.
/// This contract serves as a trusted source for implementation upgrades.
///
/// # Design Notes
///
/// The Oracle should implement Ownable and Pausable standard interfaces to ensure:
/// - Only authorized entities can approve new implementations
/// - The system can be paused in case of emergencies
///
/// # Security
///
/// The Oracle is a critical component in the upgrade system, acting as a
/// gatekeeper to prevent unauthorized or malicious contract upgrades.
impl Oracle for Contract {
    /// Retrieves the approved implementation for a specific trading account.
    /// Trading accounts query this to check if an upgrade is available.
    ///
    /// # Arguments
    ///
    /// * `contract_id` - The ContractId of the trading account checking for upgrades
    ///
    /// # Returns
    ///
    /// * `Option<ContractId>` - The approved implementation if an upgrade exists, None otherwise
    ///
    /// # Storage Access
    ///
    /// - Reads: Approved implementation mapping for the given contract
    ///
    /// # Usage
    ///
    /// Trading accounts call this method through `check_upgrade()` to determine
    /// if they should upgrade to a new implementation.
    #[storage(read)]
    fn get_trade_account_impl() -> Option<ContractId> {
        storage::trading_account_oracle::v1.trading_account_implementation.read()
    }

    /// Sets an approved implementation for a trading account upgrade.
    /// Only authorized entities (owner/admin) should be able to call this.
    ///
    /// # Arguments
    ///
    /// * `contract_id` - The new implementation ContractId to approve
    ///
    /// # Returns
    ///
    /// * `bool` - True if the implementation was successfully set, false otherwise
    ///
    /// # Storage Access
    ///
    /// - Reads: Verifies caller authorization (should check owner/admin status)
    /// - Writes: Updates the approved implementation registry
    ///
    /// # Security
    ///
    /// - Should verify the caller is the contract owner or authorized admin
    /// - Should validate the new implementation contract exists and is valid
    /// - May implement additional checks like contract bytecode verification
    ///
    /// # Events
    ///
    /// - Should emit an event when a new implementation is approved
    ///
    /// # Reverts
    ///
    /// - If caller is not authorized (owner/admin check)
    /// - If contract_id is zero or invalid
    /// - If the contract is paused
    #[storage(read, write)]
    fn set_trade_account_impl(contract_id: ContractId) -> bool {
        only_owner();
        require_not_paused();

        require(contract_id != ContractId::zero(), "Contract is zero");
        require(
            asm(blob_id: contract_id, len) {
                bsiz len blob_id;
                len: u64
            } != 0,
            "Blob does not exist",
        );

        storage::trading_account_oracle::v1
            .trading_account_implementation
            .write(Some(contract_id));

        true
    }

    /// Initializes the oracle contract with an owner and initial implementation.
    /// This method can only be called once during contract deployment.
    ///
    /// # Arguments
    ///
    /// * `owner` - The Identity who will own and control the oracle
    /// * `trade_account_impl` - The initial approved trade account implementation
    ///
    /// # Storage Access
    ///
    /// - Reads: Checks if already initialized
    /// - Writes: Sets owner and initial implementation
    ///
    /// # Security
    ///
    /// - Can only be called once (initialization check)
    /// - Validates that the implementation contract exists
    ///
    /// # Reverts
    ///
    /// - If oracle is already initialized
    /// - If trade_account_impl doesn't exist as a deployed contract
    /// - If owner is zero address
    #[storage(read, write)]
    fn initialize(owner: Identity, trade_account_impl: ContractId) {
        initialize_ownership(owner);

        require(
            asm(blob_id: trade_account_impl, len) {
                bsiz len blob_id;
                len: u64
            } != 0,
            "Blob does not exist",
        );

        storage::trading_account_oracle::v1
            .trading_account_implementation
            .write(Some(trade_account_impl));
    }

    /// Transfers ownership of the oracle to a new owner.
    /// Only the current owner can transfer ownership.
    ///
    /// # Arguments
    ///
    /// * `new_owner` - The Identity to transfer ownership to
    ///
    /// # Storage Access
    ///
    /// - Reads: Current owner for verification
    /// - Writes: Updates owner to new_owner
    ///
    /// # Security
    ///
    /// - Only callable by current owner
    /// - New owner cannot be zero address
    ///
    /// # Events
    ///
    /// - Emits ownership transfer event (from ownership library)
    ///
    /// # Reverts
    ///
    /// - If caller is not the current owner
    /// - If new_owner is zero address
    #[storage(read, write)]
    fn transfer_ownership(new_owner: Identity) {
        transfer_ownership(new_owner);
    }
}

impl SRC5 for Contract {
    #[storage(read)]
    fn owner() -> State {
        _owner()
    }
}

impl Pausable for Contract {
    #[storage(write)]
    fn pause() {
        only_owner();
        _pause();
    }

    #[storage(write)]
    fn unpause() {
        only_owner();
        _unpause();
    }

    #[storage(read)]
    fn is_paused() -> bool {
        _is_paused()
    }
}
