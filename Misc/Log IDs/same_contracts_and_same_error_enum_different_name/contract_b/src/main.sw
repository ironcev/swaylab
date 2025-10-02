contract;

enum SomeErrorDiff {
    A: (),
    B: (),
}

abi MyContract {
    fn test_function() -> bool;
}

impl MyContract for Contract {
    fn test_function() -> bool {
        log(SomeErrorDiff::A);
        true
    }
}
