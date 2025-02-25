struct MyStruct<const N: u32> { }

impl<const N : u32> MyStruct<N> {
    const CONST : u32 = N;
}

impl<const N : u32> MyStruct<N> {
    const TRAIT_CONST : u32 = N + 100;
}

trait TraitWithConst {
    const TRAIT_CONST: u32;
}

struct OtherStruct<const N: u32> { }

impl<const N: u32> TraitWithConst for MyStruct<N> {
    const TRAIT_CONST: u32 = N;
}

trait ToU8 {
    fn const_u8() -> u8;
}

struct S<T> {
    x: T,
}

impl S<u64> {
    const C: u8 = 1;
}

impl S<u32> {
    const C: u8 = 2; 
}

// impl<T> S<T> where T: ToU8 {
//     const C: u8 = T::const_u8();
// }

impl ToU8 for u8 {
    fn const_u8() -> u8 {
        3
    }
}

fn main() {
    println!("{}", S::<u64>::C);
    println!("{}", S::<u32>::C);
    // println!("{}", S::<u8>::C);
    println!("{}", MyStruct::<1>::CONST);
    println!("{}", MyStruct::<2>::CONST);
    println!("{}", MyStruct::<1>::TRAIT_CONST);
    println!("{}", MyStruct::<2>::TRAIT_CONST);
}
