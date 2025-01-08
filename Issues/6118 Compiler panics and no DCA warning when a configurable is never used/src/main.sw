contract;

abi Test {
    fn test() -> bool;
}

configurable {
    MAX_SUPPLY: u64 = 3,
    OTHER: u64 = 3,
    MORE: u64 = 3,
}

impl Test for Contract {
    fn test() -> bool {
        true
    }
}
