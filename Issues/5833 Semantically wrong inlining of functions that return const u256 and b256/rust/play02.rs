struct S {
    x: u64,
    y: u64,
}

const CONST: u64 = 0;

fn main() {
    let p_s_1 = &CONST;
    let p_s_2 = &CONST;
    
    println!("p_s_1: {:p}", p_s_1);
    println!("p_s_2: {:p}", p_s_2);
}

// p_s_1: 0x5584af1f7068
// p_s_2: 0x5584af1f7068
