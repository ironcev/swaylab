contract;

const CONST: u64 = 330000;

abi Abi {
    // const ABI_CONST: u64 = 110000;
    fn abi_fn();
}

impl Abi for Contract {
    // const ABI_CONST: u64 = 220000;
    fn abi_fn() {
        // let _ = CONST;
        // let _ = Self::ABI_CONST;
        module_fn();
    }
}

fn module_fn() {
    let _ = CONST;
}

#[test]
fn test() {
    let a = abi(Abi, CONTRACT_ID);
    let _ = CONST;
}
