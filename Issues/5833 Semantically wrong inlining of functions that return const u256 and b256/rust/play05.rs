struct S {
    x: u64,
    y: u64,
}

const CONST_S_1: S = S { x: 0, y: 0, };
const CONST_S_2: S = S { x: 0, y: 0, };

fn main() {
    println!("CONST_S_1: {:p}", &CONST_S_1);
    println!("CONST_S_2: {:p}", &CONST_S_2);
}

// CONST_S_1: 0x560e4f164010
// CONST_S_2: 0x560e4f164010
