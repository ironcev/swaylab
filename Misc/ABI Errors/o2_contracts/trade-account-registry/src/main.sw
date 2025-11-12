contract;

use contract_schema::{oracle::Oracle, proxys::TradeAccountProxy, register::*};
use std::{
    alloc::alloc_bytes,
    asset::transfer,
    auth::msg_sender,
    call_frames::msg_asset_id,
    context::msg_amount,
    external::bytecode_root,
    result::Result,
    storage::storage_vec::*,
    time::Time,
};
use ownership::*;
use src5::*;
use src12::*;
use src14::*;
use pausable::*;
use bytecode::*;

const PAGE_SIZE: u64 = 50;

configurable {
    INITIAL_OWNER: State = State::Uninitialized,
    ORACLE_CONTRACT_ID: ContractId = ContractId::zero(),
    TRADE_ACCOUNT_PROXY_ROOT: BytecodeRoot = BytecodeRoot::zero(),
    DEFAULT_TRADE_ACCOUNT_PROXY: ContractId = ContractId::zero(),
}

storage {
    registry {
        v1 {
            owner_trade_account: StorageMap<Identity, ContractId> = StorageMap {},
            trade_account_referer: StorageMap<ContractId, Identity> = StorageMap {},
            trade_accounts: StorageVec<TradeAccountRegistered> = StorageVec {},
            trade_account_contracts: StorageMap<ContractId, Identity> = StorageMap {},
        },
    },
}

impl SRC12 for Contract {
    #[storage(read, write)]
    fn register_contract(
        child_contract: ContractId,
        configurables: Option<Vec<(u64, Vec<u8>)>>,
    ) -> Result<BytecodeRoot, str> {
        if _is_paused() {
            return Err("Contract Paused");
        }

        // Ensure valid configurables
        if configurables.is_none()
            || configurables.unwrap().len() != 2
        {
            return Err("Invalid Configuables");
        }

        // Convert configurable data into oracle and trading account owner
        let oracle_as_vec = configurables.unwrap().get(0).unwrap().1;
        let owner_as_vec = configurables.unwrap().get(1).unwrap().1;

        if oracle_as_vec.len() != 32 || owner_as_vec.len() != 48 {
            return Err("Parsing Error on configurables");
        }

        if asm(ptr: owner_as_vec
                .ptr(), val) {
                lw val ptr i0;
                val: u64
            } > 2
                || asm(
                    ptr: owner_as_vec.ptr(),
                    offset: 8,
                    new,
                    val,
                ) {
                    add new ptr offset;
                    lw val new i0;
                    val: u64
                } > 1
        {
            return Err("Parsing Error on configurables");
        }

        let oracle_contract = asm(bytes: oracle_as_vec.ptr()) {
            bytes: ContractId
        };
        let owner = match asm(bytes: owner_as_vec.ptr()) {
            bytes: State
        }.owner() {
            Some(owner) => owner,
            None => {
                return Err("OwnerNotInitialized");
            }
        };

        // Check if owner already has a Trade Account and verify the oracle is correct
        if oracle_contract != ORACLE_CONTRACT_ID {
            return Err("Invalid Oracle Contract");
        } else if storage::registry::v1.owner_trade_account.get(owner).try_read().is_some()
        {
            return Err("OwnerAlreadyHasTradeAccount");
        }

        // Check the trade account's proxy target
        let oracle_blob_id_target = abi(Oracle, ORACLE_CONTRACT_ID.bits()).get_trade_account_impl();
        let proxy_blob_id_target = abi(SRC14, child_contract.bits()).proxy_target();
        if oracle_blob_id_target != proxy_blob_id_target {
            return Err("Invalid Proxy Target Set");
        }

        // Load the default bytecode of the trade account proxy
        let contract_size = asm(load_target: DEFAULT_TRADE_ACCOUNT_PROXY, length) {
            bsiz length load_target;
            length: u64
        };
        let loaded_bytecode_ptr = asm(
            load_target: DEFAULT_TRADE_ACCOUNT_PROXY,
            length: contract_size,
            ptr,
        ) {
            aloc length;
            move ptr hp;
            bldd ptr load_target zero length;
            ptr: raw_ptr
        };
        let mut vec_bytecode: Vec<u8> = Vec::from(raw_slice::from_parts::<u8>(loaded_bytecode_ptr, contract_size));

        // Verify the trade account proxy bytecode
        let returned_root = bytecode_root(child_contract);
        let computed_root = compute_bytecode_root(vec_bytecode, configurables);
        if computed_root != returned_root {
            return Err("Invalid Contract");
        };

        // Create and store the registration record
        let registration = TradeAccountRegistered::new(child_contract, owner);
        storage::registry::v1.trade_accounts.push(registration);
        storage::registry::v1
            .owner_trade_account
            .insert(owner, child_contract);
        storage::registry::v1
            .trade_account_contracts
            .insert(child_contract, owner);

        // Log the event
        let event = TradeAccountRegistered::new(child_contract, owner);
        event.log();

        Ok(computed_root)
    }

    #[storage(read)]
    fn is_valid(child_contract: ContractId) -> bool {
        storage::registry::v1.trade_account_contracts.get(child_contract).try_read().is_some()
    }

    #[storage(read)]
    fn factory_bytecode_root() -> Option<b256> {
        Some(TRADE_ACCOUNT_PROXY_ROOT)
    }
}

impl TradeAccountRegistry for Contract {
    fn default_bytecode() -> Option<ContractId> {
        Some(DEFAULT_TRADE_ACCOUNT_PROXY)
    }

    fn get_oracle_id() -> ContractId {
        ORACLE_CONTRACT_ID
    }

    #[storage(read, write)]
    fn register_referer(referer: Identity) {
        require_not_paused();

        let trade_account_id = msg_sender().unwrap();
        if let Identity::ContractId(contract_id) = trade_account_id
        {
            let trade_account_registered = storage::registry::v1.trade_account_contracts.get(contract_id).try_read();
            require(
                trade_account_registered
                    .is_some(),
                TradeAccountRegistryError::TradeAccountNotRegistered,
            );
            let trade_account_referer = storage::registry::v1.trade_account_referer.get(contract_id).try_read();
            require(
                trade_account_referer
                    .is_none(),
                TradeAccountRegistryError::TradeAccountAlreadyHasReferer,
            );
            storage::registry::v1
                .trade_account_referer
                .insert(contract_id, referer);
            let event = TradeAccountReferer::new(contract_id, referer);
            event.log();
        } else {
            require(false, "Required to be a trade account owner");
        }
    }

    #[storage(read)]
    fn get_trade_account_referer(contract_id: ContractId) -> Option<Identity> {
        storage::registry::v1.trade_account_referer.get(contract_id).try_read()
    }

    #[storage(read)]
    fn get_trade_account(owner: Identity) -> Option<ContractId> {
        storage::registry::v1.owner_trade_account.get(owner).try_read()
    }

    #[storage(read)]
    fn get_trade_accounts(page: u64) -> Page<TradeAccountRegistered> {
        let total_items = storage::registry::v1.trade_accounts.len();
        let start_index = page * PAGE_SIZE;

        let mut items = Vec::new();

        if start_index < total_items {
            let end_index = if start_index + PAGE_SIZE > total_items {
                total_items
            } else {
                start_index + PAGE_SIZE
            };

            let mut i = start_index;
            while i < end_index {
                match storage::registry::v1.trade_accounts.get(i) {
                    Some(storage_key) => {
                        if let Some(trade_account) = storage_key.try_read() {
                            items.push(trade_account);
                        }
                    },
                    None => {},
                }
                i += 1;
            }
        }

        Page {
            items,
            page,
            total: total_items,
        }
    }
}

impl O2RegistryAdmin for Contract {
    #[storage(read, write)]
    fn initialize() {
        match INITIAL_OWNER.owner() {
            Some(owner) => initialize_ownership(owner),
            None => revert_with_log("Ownership not set"),
        }
    }
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
