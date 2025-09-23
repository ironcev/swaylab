contract;

mod non_generic;
mod generic;

use non_generic::*;

abi FirstAbi {
    fn friendly_fn_in_first_abi(s: Struct, x: (u256, Struct)) -> bool;
} {
    fn friendly_provided_fn_in_first_abi(s: Struct) -> (b256, bool) {
        non_generic::play();
        generic::play();
        panic;
    }
}

abi SecondAbi {
    fn friendly_fn_in_second_abi(s: Struct) -> bool;
} {
    fn friendly_provided_fn_in_second_abi(s: Struct) -> (b256, bool) {
        non_generic::play();
        generic::play();
        panic;
    }
}

impl FirstAbi for Contract {
    fn friendly_fn_in_first_abi(s: Struct, x: (u256, Struct)) -> bool {
        non_generic::play();
        generic::play();
        panic;
    }
}

impl SecondAbi for Contract {
    fn friendly_fn_in_second_abi(s: Struct) -> bool {
        non_generic::play();
        generic::play();
        panic;
    }
}

trait ContractTrait {
    fn friendly_fn_in_contract_trait(s: Struct);
}

abi ThirdAbi: ContractTrait {
} {
    fn friendly_provided_fn_in_third_abi(s: Struct) {
        Self::friendly_fn_in_contract_trait(s);
    }
}

impl ContractTrait for Contract {
    fn friendly_fn_in_contract_trait(s: Struct) {
        panic;
    }
}

impl ThirdAbi for Contract {}

impl Contract {
    fn friendly_fn_in_impl_contract(s: Struct) -> (b256, bool) {
        non_generic::play();
        generic::play();
        panic;
    }
}

#[test]
fn test() {
    let caller = abi(FirstAbi, CONTRACT_ID);
    let s = Struct {};
    let x = (u256::from(42u8), s);
    let _ = caller.friendly_fn_in_first_abi(s, x);
    let _ = caller.friendly_provided_fn_in_first_abi(s);

    let caller = abi(SecondAbi, CONTRACT_ID);
    let _ = caller.friendly_fn_in_second_abi(s);
    let _ = caller.friendly_provided_fn_in_second_abi(s);

    let caller = abi(ThirdAbi, CONTRACT_ID);
    let _ = caller.friendly_provided_fn_in_third_abi(s);

    let caller = abi(AbiBacktracingAbi, CONTRACT_ID);
    let _ = caller.friendly_fn_in_impl_contract(s);
}