library;

enum Enum {
    A: (),
    B: (),
}

pub fn play() -> () {
    let e = Enum::A;

    let _x = match e {
        Enum::A => 0,
        Enum::B => 0,
        _ => 0,
        _ => 0,
    };

    poke(Enum::B);
}

fn poke<T>(x: T) -> () { let _ = x; () }
