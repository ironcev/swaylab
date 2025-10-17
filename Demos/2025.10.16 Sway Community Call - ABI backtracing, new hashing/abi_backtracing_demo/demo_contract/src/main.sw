contract;

use demo_lib::preconditions::check_number;

impl Contract {
    fn demo_check_number(number: u64) {
        some_additional_function(number);
    }
}

fn some_additional_function(number: u64) {
    check_number(number);
}   

#[test]
fn demo_check_number_failing() {
    let caller = abi(DemoContractAbi, CONTRACT_ID);
    caller.demo_check_number(6);
}