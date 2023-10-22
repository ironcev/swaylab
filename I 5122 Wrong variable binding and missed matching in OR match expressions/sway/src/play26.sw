library;

enum Enum {
    A: (u64),
    B: (u64),
}

struct Struct {
    x: u64,
    y: u64,
    z: u64
}

fn inc_i(ref mut i: u64) -> Struct {
    i = i + 11;
 
    Struct { x: 21, y: 21, z: 1 }
}

pub fn play() -> () {
    let e = Enum::A(42);

    let x = match e {
        _ => 9999,
    };
    assert(x == 9999);

    let x = match e {
        Enum::A(x) | Enum::B(x) => x,
    };
    assert(x == 42);

    let x = match e {
        Enum::A(_) | Enum::B(_) => 9999,
    };
    assert(x == 9999);

    let e = 42u64;
    let x = match e {
        y => y,
    };
    assert(x == 42);

    let mut i = 0;
    match e {
        _ => {
            inc_i(i);
        }
    };
    assert(i == 11);
}
