struct S {
    x: u64,
    y: u64,
}

const CONST: S = S { x: 0, y: 0, };

fn main() {
    let p_s_1 = &CONST;
    let p_s_2 = &CONST;
    
    println!("p_s_1: {:p}", p_s_1);
    println!("p_s_2: {:p}", p_s_2);
}

// p_s_1: 0x5628cd834000
// p_s_2: 0x5628cd834000
