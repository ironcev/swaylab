library;

struct S {
    x: u64,
    y: u64,
    z: u64,
}

enum Enum {
    A: u64,
    S: S,
}

pub fn play() -> () {
    let e = Enum::A(0);

    let _x = match e {
        Enum::A(_) => 0,
        Enum::S(_) => 1,
        _ => 9999,
    };
}
