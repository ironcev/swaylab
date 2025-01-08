contract;

configurable {
    CONFIG_X: u64 = 42,
}

abi TestContract {
    fn test_configurables_and_consts() -> (u64, u64);
}

impl TestContract for Contract {
    fn test_configurables_and_consts() -> (u64, u64) {
        const X = CONFIG_X;
        let x = CONFIG_X;

        assert(X != x);

        (X, x)
    }
}
