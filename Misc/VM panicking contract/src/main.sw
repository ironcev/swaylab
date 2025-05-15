contract;

abi MyContract {
    fn test_function() -> bool;
}

impl MyContract for Contract {
    fn test_function() -> bool {
        asm(ra: 0, rb: 0, rc: 0) {
            mcp ra rb rc;
        };

        true
    }
}

#[test]
fn call_test_function() {
    let caller = abi(MyContract, CONTRACT_ID);
    let _ = caller.test_function();
}
