contract;

use contract_schema::{oracle::Oracle, proxys::{OwnershipTransferredEvent, TradeAccountProxy}};
use ownership::errors::InitializationError;
use upgradability::{
    _proxy_owner,
    _proxy_target,
    _set_proxy_owner,
    _set_proxy_target,
    only_proxy_owner,
};
use src14::{SRC14, SRC14Extension};
use src5::State;
use std::{crypto::signature::Signature, execution::run_external, string::String};
use contract_libs::signature::*;
use contract_libs::proxy::run_external_blob;

configurable {
    ORACLE_CONTRACT_ID: ContractId = ContractId::zero(),
    /// The initial value of `storage::SRC14.proxy_owner`.
    INITIAL_OWNER: State = State::Uninitialized,
}

storage {
    SRC14 {
        /// The [ContractId] of the target contract.
        ///
        /// # Additional Information
        ///
        /// `target` is stored at sha256("storage_SRC14_0")
        target in 0x7bb458adc1d118713319a5baa00a2d049dd64d2916477d2688d76970c898cd55: Option<ContractId> = None,
        /// The [State] of the proxy owner.
        ///
        /// # Additional Information
        ///
        /// `proxy_owner` is stored at sha256("storage_SRC14_1")
        proxy_owner in 0xbb79927b15d9259ea316f2ecb2297d6cc8851888a98278c0a2e03e1a091ea754: State = State::Uninitialized,
    },
}

impl SRC14Extension for Contract {
    /// Returns the owner of the proxy contract.
    ///
    /// # Returns
    ///
    /// * [State] - Represents the state of ownership for this contract.
    ///
    /// # Number of Storage Accesses
    ///
    /// * Reads: `1`
    #[storage(read)]
    fn proxy_owner() -> State {
        _proxy_owner()
    }
}

impl SRC14 for Contract {
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
    fn set_proxy_target(_new_target: ContractId) {
        only_proxy_owner();

        let new_impl = abi(Oracle, ORACLE_CONTRACT_ID.bits()).get_trade_account_impl();
        require(
            new_impl != storage::SRC14
                .target
                .read(),
            "No upgrade available",
        );

        require(
            asm(blob_id: new_impl
                .unwrap(), len) {
                bsiz len blob_id;
                len: u64
            } != 0,
            "Blob does not exist",
        );

        _set_proxy_target(new_impl.unwrap());
    }

    /// Returns the target contract of the proxy contract.
    ///
    /// # Returns
    ///
    /// * [Option<ContractId>] - The new proxy contract to which all fallback calls will be passed or `None`.
    ///
    /// # Number of Storage Accesses
    ///
    /// * Reads: `1`
    #[storage(read)]
    fn proxy_target() -> Option<ContractId> {
        _proxy_target()
    }
}

impl TradeAccountProxy for Contract {
    /// Initializes the proxy contract.
    ///
    /// # Additional Information
    ///
    /// This method sets the storage values using the values of the configurable constants `INITIAL_TARGET` and `INITIAL_OWNER`.
    /// This then allows methods that write to storage to be called.
    /// This method can only be called once.
    ///
    /// # Reverts
    ///
    /// * When `storage::SRC14.proxy_owner` is not [State::Uninitialized].
    ///
    /// # Number of Storage Accesses
    ///
    /// * Writes: `2`
    #[storage(write)]
    fn initialize() {
        require(
            _proxy_owner() == State::Uninitialized,
            InitializationError::CannotReinitialized,
        );

        let new_target = abi(Oracle, ORACLE_CONTRACT_ID.bits()).get_trade_account_impl();
        require(
            new_target
                .unwrap() != ContractId::zero(),
            "Contract is zero",
        );
        require(
            asm(blob_id: new_target
                .unwrap(), len) {
                bsiz len blob_id;
                len: u64
            } != 0,
            "Blob does not exist",
        );

        storage::SRC14.target.write(new_target);
        storage::SRC14.proxy_owner.write(INITIAL_OWNER);

        OwnershipTransferredEvent::new(None, INITIAL_OWNER.owner().unwrap())
            .log();
    }

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
    fn check_upgrade() -> Option<ContractId> {
        let new_impl = abi(Oracle, ORACLE_CONTRACT_ID.bits()).get_trade_account_impl();

        if new_impl == storage::SRC14.target.read() {
            None
        } else {
            new_impl
        }
    }

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
    fn set_proxy_target_with_signature(signature: Option<Signature>) {
        let _ = only_proxy_owner_with_signature(
            signature,
            String::from("set_proxy_target_with_signature"),
            (),
        ).unwrap();

        let new_impl = abi(Oracle, ORACLE_CONTRACT_ID.bits()).get_trade_account_impl();
        require(
            new_impl != storage::SRC14
                .target
                .read(),
            "No upgrade available",
        );

        require(
            asm(blob_id: new_impl
                .unwrap(), len) {
                bsiz len blob_id;
                len: u64
            } != 0,
            "Blob does not exist",
        );

        _set_proxy_target(new_impl.unwrap());
    }
}

/// Loads and runs the target contract's code within the proxy contract's context.
///
/// # Additional Information
///
/// Used when a method that does not exist in the proxy contract is called.
#[fallback]
#[storage(read)]
fn fallback() {
    run_external_blob(_proxy_target().expect("FallbackError::TargetNotSet"))
}
