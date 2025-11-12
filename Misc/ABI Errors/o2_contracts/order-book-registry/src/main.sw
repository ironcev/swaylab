contract;

use contract_schema::register::*;
use std::{
    asset::transfer,
    auth::msg_sender,
    call_frames::msg_asset_id,
    context::msg_amount,
    result::Result,
    storage::storage_vec::*,
    time::Time,
};
use ownership::*;
use src5::*;
use pausable::*;

const PAGE_SIZE: u64 = 50;

storage {
    registry {
        v1 {
            market_order_book: StorageMap<MarketId, ContractId> = StorageMap {},
            order_books: StorageVec<OrderBookRegistered> = StorageVec {},
        },
    },
}

configurable {
    INITIAL_OWNER: State = State::Uninitialized,
}

impl OrderBookRegistry for Contract {
    #[storage(read, write)]
    fn register_order_book(
        contract_id: ContractId,
        market_id: MarketId,
    ) -> Result<(), OrderBookRegistryError> {
        only_owner();
        require_not_paused();

        // Check if market already has an Order Book
        if storage::registry::v1.market_order_book.get(market_id).try_read().is_some()
        {
            return Err(OrderBookRegistryError::MarketAlreadyHasOrderBook);
        }

        // Store the mapping
        storage::registry::v1
            .market_order_book
            .insert(market_id, contract_id);

        // Create and store the registration record
        let registration = OrderBookRegistered::new(contract_id, market_id);
        storage::registry::v1.order_books.push(registration);

        // Log the event
        let event = OrderBookRegistered::new(contract_id, market_id);
        event.log();
        Ok(())
    }

    #[storage(read)]
    fn get_order_book(market_id: MarketId) -> Option<ContractId> {
        storage::registry::v1.market_order_book.get(market_id).try_read()
    }

    #[storage(read)]
    fn get_order_books(page: u64) -> Page<OrderBookRegistered> {
        let total_items = storage::registry::v1.order_books.len();
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
                match storage::registry::v1.order_books.get(i) {
                    Some(storage_key) => {
                        if let Some(order_book) = storage_key.try_read() {
                            items.push(order_book);
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
