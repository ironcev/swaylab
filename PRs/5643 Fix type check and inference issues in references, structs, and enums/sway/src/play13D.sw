library;

enum GenericEnum3<A, B, C> {
    A: A,
    B: B,
    C: C,
}

pub fn play() -> u64 {
    let o: GenericEnum3<u8, bool, u32> = GenericEnum3::<_, _, _>::A(123);
    let _ = match o {
        GenericEnum3::A(x) => assert(x == 123u8),
        GenericEnum3::B(x) => { 
            let _ = x == true;
            assert(false);
        },
        GenericEnum3::C(x) => { 
            let _ = x == 0u32;
            assert(false);
        },
    };

    42
}
