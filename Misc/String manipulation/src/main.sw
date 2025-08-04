contract;

use std::storage::storage_vec::*;
use std::storage::storage_string::*;
use std::string::*;

abi MyContract {
    fn input_vec_str(input: Vec<str>) -> str;
    fn input_str(input: str) -> str;

    #[storage(read, write)]
    fn store_string(input: str);

    #[storage(read)]
    fn get_first_string() -> Option<String>;
}

storage {
    strings: StorageVec<StorageString> = StorageVec {},
}

impl MyContract for Contract {
    fn input_vec_str(input: Vec<str>) -> str {
        input.get(0).unwrap_or("<empty>")
    }

    fn input_str(input: str) -> str {
        input
    }

    #[storage(read, write)]
    fn store_string(input: str) {
        storage.strings.push(StorageString {});
        let index = storage.strings.len() - 1;
        storage.strings.get(index).unwrap().write_slice(input.into());
    }

    #[storage(read)]
    fn get_first_string() -> Option<String> {
        match storage.strings.get(0) {
            Some(string) => string.read_slice(),
            None => None,
        }
    }
}

#[test]
fn test() {
    let caller = abi(MyContract, CONTRACT_ID);

    assert_eq(caller.input_vec_str(Vec::new()), "<empty>");
    assert_eq(caller.input_str("test"), "test");

    assert_eq(caller.get_first_string(), None);

    caller.store_string("hello world");

    let first_string = String::from_ascii_str("hello world");
    assert_eq(caller.get_first_string(), Some(first_string));
}