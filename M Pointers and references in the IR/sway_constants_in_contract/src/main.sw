contract;

struct S { }

impl S {
    const S_C: u64 = 0;
}

abi Abi {
    const ABI_A: u64 = 112200;
    const ABI_B: u64 = 112211;
    fn test();
}

impl Abi for Contract {
    const ABI_A: u64 = 332200;
    const ABI_B: u64 = 332211;
    fn test() {
        let _ = Self::ABI_A;
        let _ = Self::ABI_B;
    }
}