contract;

pub mod errors;
mod even;
mod odd;

use errors::EvenOddError;

abi DemoContract {
    #[storage(write)]
    fn set_odd(value: u64);
    #[storage(write)]
    fn set_even(value: u64);
}

storage {
    last_value: u64 = 0,
}

impl DemoContract for Contract {
    #[storage(write)]
    fn set_odd(value: u64) {
        if value == 0 {
            panic EvenOddError::SetOddIsZero;
        }

        odd::check_odd(value);

        storage.last_value.write(value);
    }

    #[storage(write)]
    fn set_even(value: u64) {
        if value == 0 {
            panic EvenOddError::SetEvenIsZero;
        }

        even::check_even(value);

        storage.last_value.write(value);
    }
}

#[test]
fn test_set_zero() {
    let caller = abi(DemoContract, CONTRACT_ID);
    caller.set_odd(0);
}

#[test]
fn test_set_odd() {
    let caller = abi(DemoContract, CONTRACT_ID);
    caller.set_odd(2);
}

#[test]
fn test_set_even() {
    let caller = abi(DemoContract, CONTRACT_ID);
    caller.set_even(1);
}