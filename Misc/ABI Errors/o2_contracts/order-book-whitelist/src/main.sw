contract;

use contract_schema::whitelist::*;
use ownership::*;
use src5::*;
use std::{asset::{burn, mint}, context::this_balance};

configurable {
    INITIAL_OWNER: State = State::Uninitialized,
}

impl Whitelist for Contract {
    #[storage(read)]
    fn whitelist(trader: Identity) {
        only_owner();
        let trader_bits = trader.bits();
        require(
            this_balance(AssetId::new(ContractId::this(), trader_bits)) == 0,
            WhitelistError::TraderAlreadyWhitelisted,
        );

        mint(trader_bits, 1);

        AddWhitelistEvent::new(trader).log();
    }

    #[storage(read)]
    fn remove_whitelist(trader: Identity) {
        only_owner();
        let trader_bits = trader.bits();
        require(
            this_balance(AssetId::new(ContractId::this(), trader_bits)) == 1,
            WhitelistError::TraderNotWhitelisted,
        );

        burn(trader_bits, 1);

        RemoveWhitelistEvent::new(trader).log();
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
