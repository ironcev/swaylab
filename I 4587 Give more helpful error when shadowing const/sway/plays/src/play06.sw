library;

struct Struct { }

impl Struct {
    const S_X: u32 = 1;

    fn a() {
        poke(S_X);

        // const S_X: u32 = 2; // The name `S_X` is defined multiple times

        poke(S_X);
    }
}

enum Enum {
    A: (),
    B: (),
}

impl Enum {
    const E_X: u32 = 1;

    fn a() {
        poke(E_X);

        // const E_X: u32 = 2; // The name `E_X` is defined multiple times

        poke(E_X);
    }
}

const M_X: u32 = 1;

struct S { }

impl S {
    const M_X: u32 = 1; // The name `M_X` is defined multiple times
}

pub fn play() -> () {
    let s = Struct {};
    poke(s);

    Struct::a();
    poke(Struct::S_X);

    Enum::a();
    poke(Enum::E_X); // Variant "E_X" does not exist on enum "Enum"
}

fn poke<T>(x: T) -> () { let _ = x; () }