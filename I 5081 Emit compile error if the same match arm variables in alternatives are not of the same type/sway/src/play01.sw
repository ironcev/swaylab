library;

struct Struct {
    x: bool,
    y: u64,
}

impl Struct {
    fn new() -> Self {
        Self {
            x: false,
            y: 0,
        }
    }
}

enum Enum {
    A: (bool),
    B: (u64),
    C: (Struct)
}

pub fn play() -> () {
    let s1 = Struct::new();

    let _x = match s1 {
        Struct { x, y } | Struct { x: y, y: x } => if y { 0 } else { x },
    };

    let s2 = Struct::new();

    let _x = match s2 {
        Struct { x: a, y: b } | Struct { x: b, y: a } => if b { 0 } else { a },
    };

    let s3 = Struct::new();

    let _x = match s3 {
        Struct { x, y } | Struct { x, y } |Struct { x: y, y: x } => if y { 0 } else { x },
    };

    let s4 = Struct::new();

    let _x = match s4 {
        Struct { x: a, y: b } | Struct { x: a, y: b } |Struct { x: b, y: a } => if b { 0 } else { a },
    };

    let e1 = Enum::A(false);

    let _x = match e1 {
        Enum::A(x) | Enum::B(x) => x,
        _ => 0,
    };

    let e2 = Enum::A(false);

    let _x = match e2 {
        Enum::A(x) | Enum::A(x) | Enum::C(x) => x.x,
        _ => false,
    };

    let t1 = (0u64, false, Struct::new(), Enum::A(true));

    let _x = match t1 {
        (x, y, z, k) | (y, x, k, z) => 0,
    };

    let t2 = (0u64, false, Struct::new(), Enum::A(true));

    let _x = match t2 {
        (x, y, Struct { x: a, y: b }, _) | (x, y, Struct { x: b, .. }, Enum::B(a)) => 0,
        _ => 0,
    };

    poke(Enum::B(0));
    poke(Enum::C(Struct::new()));
}

fn poke<T>(_x: T) { }
