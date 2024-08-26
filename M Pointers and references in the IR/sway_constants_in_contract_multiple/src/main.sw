contract;

struct S { }

impl S {
    const S_C: u64 = 0;
}

abi Abi1 {
    const ABI_A: u64 = 110000;
    // const ABI_B: u64 = 112211;
    // fn test1();
    fn test();
}

abi Abi2 {
    const ABI_A: u64 = 111100;
    // const ABI_B: u64 = 112211;
    // fn test2();
    fn test();
}

impl Abi1 for Contract {
    const ABI_A: u64 = 330000;
    // const ABI_B: u64 = 332211;
    // fn test1() {
    fn test() {
        let _ = Self::ABI_A;
        // let _ = Self::ABI_B;
    }
}

impl Abi2 for Contract {
    const ABI_A: u64 = 331100;
    // const ABI_B: u64 = 332211;
    // fn test2() {
    fn test() {
        let _ = Self::ABI_A;
        // let _ = Self::ABI_B;
    }
}