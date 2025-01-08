contract;

abi TestContract {
    fn test_method();
}

impl TestContract for Contract {
    fn test_method() {
        while (true && true) {}
    }
}