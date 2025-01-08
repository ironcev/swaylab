trait T1 {
    const C: u64 = 3;   
}

trait T2 {
    const C: u64 = 13;   
}

trait T3 {
    const C: u64;   
}

enum E { }

impl E {
    const C: u64 = 222;
}

impl T1 for E { }

impl T2 for E {
    const C: u64 = 1313;
}

// impl T3 for E {
// }
// error[E0046]: not all trait items implemented, missing: `C`

fn main() {
    println!("{}", E::C);
    println!("{}", <E as T1>::C);
    println!("{}", <E as T2>::C);
    
    // println!("{}", T1::C);
    // error[E0790]: cannot refer to the associated constant on trait without specifying the corresponding `impl` type
}
