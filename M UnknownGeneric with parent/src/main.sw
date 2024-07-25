script;

trait T1 {}
trait T2 {}

struct S<T> where T: T1 { }

impl<T> S<T> where T: T1 {
    fn only_t1(self) {}
    fn also_t2(self) where T: T2 {} // <<<--- Parenting happens here.
    // The more constrained generic parameter `T` in the method
    // will have the struct level generic parameter `T` as its parent.
}

impl T1 for u8 {}

impl T1 for u64 {}
impl T2 for u64 {}

fn main() {
    let s_u8 = S::<u8> { };
    s_u8.only_t1();
    s_u8.also_t2(); // <<<--- ERROR: Trait "T2" is not implemented for type "u8".

    let s_u64 = S::<u64> { };
    s_u64.only_t1();    
    s_u64.also_t2();
}
