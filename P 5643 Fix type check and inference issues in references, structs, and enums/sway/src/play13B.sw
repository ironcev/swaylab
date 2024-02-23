library;

enum GenericEnum2<A, B> {
    A: A,
    B: B,
}

enum GenericEnum3<A, B, C> {
    A: A,
    B: B,
    C: C,
}

pub fn play() -> u64 {
    let o: GenericEnum2<u8, _> = GenericEnum2::<_, bool>::A(123);
    let _ = match o {
        GenericEnum2::A(x) => x == 123u8,
        GenericEnum2::B(x) => x == false,
    };

    let o: GenericEnum2<_, bool> = GenericEnum2::<u8, _>::A(123);
    let _ = match o {
        GenericEnum2::A(x) => x == 123u8,
        GenericEnum2::B(x) => x == false,
    };

    let o: GenericEnum2<_, bool> = GenericEnum2::<u8, _>::A(123u64);
    let _ = match o {
        GenericEnum2::A(x) => x == 123u8,
        GenericEnum2::B(x) => x == false,
    };

    let o: GenericEnum3<_, _, _> = GenericEnum3::<u8, bool, u32>::A(123u8);
    let _ = match o {
        GenericEnum3::A(x) => x == 123u8,
        GenericEnum3::B(x) => x == false,
        GenericEnum3::C(x) => x == 345u32,
    };

    let o: GenericEnum3<_, _, _> = GenericEnum3::<u8, bool, u32>::A(123);
    let _ = match o {
        GenericEnum3::A(x) => x == 123u8,
        GenericEnum3::B(x) => x == false,
        GenericEnum3::C(x) => x == 345u32,
    };

    let o: GenericEnum3<u8, bool, u32> = GenericEnum3::<_, _, _>::A(123);
    let _ = match o {
        GenericEnum3::A(x) => x == 123u8,
        GenericEnum3::B(x) => x == false,
        GenericEnum3::C(x) => x == 345u32,
    };

    42
}
