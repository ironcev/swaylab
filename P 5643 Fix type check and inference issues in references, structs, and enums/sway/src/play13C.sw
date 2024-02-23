library;

enum GenericEnum3<A, B, C> {
    A: A,
    B: B,
    C: C,
}

pub fn play() -> u64 {
    let o: GenericEnum3<_, _, _> = GenericEnum3::<u8, bool, u32>::A(123);
    let _ = match o {
        GenericEnum3::A(x) => x == 123u8,
        GenericEnum3::B(x) => x == false,
        GenericEnum3::C(x) => x == 345u32,
    };

    42
}
