library;

enum Enum {
    A: (),
    B: (),
    C: (),
    D: (),
}

pub fn play() -> () {
    let e = Enum::A;

    let _x = match e {
        Enum::A => 0,
        _ => 0,
        Enum::B => 0,
        Enum::C => 0,
        Enum::D => 0,
    };

    poke(Enum::B);
    poke(Enum::C);
    poke(Enum::D);
}

fn poke<T>(x: T) -> () { let _ = x; () }
