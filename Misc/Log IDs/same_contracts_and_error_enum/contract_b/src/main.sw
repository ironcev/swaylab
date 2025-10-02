contract;

enum SomeError {
    A: (),
    B: (),
}

abi MyContract {
    fn test_function() -> bool;
}

impl MyContract for Contract {
    fn test_function() -> bool {
        log(SomeError::A);
        true
    }
}
