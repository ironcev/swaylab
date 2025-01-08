contract;

struct S { }

impl S {
    const S_C: u64 = 0;
}

abi Abi {
    const ABI_A: u64 = 110000;
    fn test();
}

impl Abi for Contract {
    const ABI_A: u64 = 330000;
    fn test() {
        let _ = Self::ABI_A;
    }
}

#[test]
fn test() {
    let a = abi(Abi, CONTRACT_ID);
}
