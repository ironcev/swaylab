contract;

use contract_schema::blacklist::*;
use ownership::*;
use src5::*;
use std::{asset::{burn, mint}, context::this_balance};

configurable {
    INITIAL_OWNER: State = State::Uninitialized,
}

impl Blacklist for Contract {
    #[storage(read)]
    fn blacklist(trader: Identity) {
        only_owner();
        require(
            this_balance(AssetId::new(ContractId::this(), trader.bits())) == 0,
            BlacklistError::TraderAlreadyBlacklisted,
        );

        mint(trader.bits(), 1);

        AddBlacklistEvent::new(trader).log();
    }

    #[storage(read)]
    fn remove_blacklist(trader: Identity) {
        only_owner();

        require(
            this_balance(AssetId::new(ContractId::this(), trader.bits())) == 1,
            BlacklistError::TraderNotBlacklisted,
        );

        burn(trader.bits(), 1);

        RemoveBlacklistEvent::new(trader).log();
    }

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
