contract;

struct S { }

impl S {
    const S_C: u64 = 0;
}

abi Abi1 {
    const ABI_A: u64 = 110000;
    const ABI_B: u64 = 112200;
    fn test1();
    // fn test();
}

abi Abi2 {
    const ABI_A: u64 = 110011;
    const ABI_B: u64 = 112211;
    fn test2();
    // fn test();
}

impl Abi1 for Contract {
    const ABI_A: u64 = 330000;
    const ABI_B: u64 = 332211;
    fn test1() {
    // fn test() {
        let _ = Self::ABI_A;
        let _ = Self::ABI_B;
    }
}

impl Abi2 for Contract {
    const ABI_A: u64 = 330011;
    const ABI_B: u64 = 332222;
    fn test2() {
    // fn test() {
        let _ = Self::ABI_A;
        let _ = Self::ABI_B;
    }
}

#[test]
fn test() {
    let a = abi(Abi1, CONTRACT_ID);
    let b = abi(Abi2, CONTRACT_ID);
}
