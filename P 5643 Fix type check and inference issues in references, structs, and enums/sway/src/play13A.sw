library;

enum GenericEnum<A, B> {
    A: A,
    B: B,
}

pub fn play() -> u64 {
    let o: GenericEnum<_, _> = GenericEnum::<_, bool>::A(123);
    let _ = match o {
        GenericEnum::A(x) => x == 123u64,
        GenericEnum::B(x) => x == false,
    };

    let o: GenericEnum<u8, _> = GenericEnum::<_, _>::A(123);
    let _ = match o {
        GenericEnum::A(x) => x == 123u8,
        GenericEnum::B(x) => x == false,
        // ERROR:              ^^ No method named "eq" found for type "B".
    };

    let o: GenericEnum<u8, _> = GenericEnum::<_, bool>::A(123);
    let _ = match o {
        GenericEnum::A(x) => x == 123u8,
        GenericEnum::B(x) => x == false,
    };

    42
}
