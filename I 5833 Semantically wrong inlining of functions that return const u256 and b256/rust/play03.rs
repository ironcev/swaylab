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
    
    println!("");
    
    let p_s_return_1 = &return_const();
    let p_s_return_2 = &return_const();
    
    println!("p_s_return_1: {:p}", p_s_return_1);
    println!("p_s_return_2: {:p}", p_s_return_2);
    
    println!("");
    
    let p_s_return_borrowed_1 = return_borrowed_const(&CONST);
    let p_s_return_borrowed_2 = return_borrowed_const(&CONST);
    
    println!("p_s_return_borrowed_1: {:p}", p_s_return_borrowed_1);
    println!("p_s_return_borrowed_2: {:p}", p_s_return_borrowed_2);
}

#[inline(never)]
fn return_const() -> S {
    CONST
}


#[inline(never)]
fn return_borrowed_const(b: &S) -> &S {
    b
}

// p_s_1: 0x55870c2d7000
// p_s_2: 0x55870c2d7000
// 
// p_s_return_1: 0x7ffcce361fc0
// p_s_return_2: 0x7ffcce361fd8
// 
// p_s_return_borrowed_1: 0x55870c2d7000
// p_s_return_borrowed_2: 0x55870c2d7000

