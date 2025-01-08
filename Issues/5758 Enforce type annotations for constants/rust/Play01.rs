trait T1 {
    const C: u64 = 3;   
}

trait T2 {
    const C: u64 = 13;   
}

trait T3 {
    const C: u64;   
}

struct S { }

impl S {
    const C: u64 = 222;
}

impl T1 for S { }

impl T2 for S {
    const C: u64 = 1313;
}

// impl T3 for S {
// }
// error[E0046]: not all trait items implemented, missing: `C`

fn main() {
    println!("{}", S::C);
    println!("{}", <S as T1>::C);
    println!("{}", <S as T2>::C);
    
    // println!("{}", T1::C);
    // error[E0790]: cannot refer to the associated constant on trait without specifying the corresponding `impl` type
}
