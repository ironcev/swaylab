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

    fn use_me(self) -> () {
        poke(self.x);
        poke(self.y);
    }
}

struct GenStruct<A, B> {
    x: A,
    y: B,
}

impl<A, B> GenStruct<A, B> {
    fn new(a: A, b: B) -> Self {
        Self {
            x: a,
            y: b,
        }
    }

    fn use_me(self) -> () {
        poke(self.x);
        poke(self.y);
    }
}

type StructAlias = Struct;
type GenStructAliasBool = GenStruct<bool, bool>;
type Boolean = bool;
type GenStructAliasBoolean = GenStruct<Boolean, Boolean>;

enum Enum {
    A(bool),
    B(u64),
    C(Struct),
    D(StructAlias),
    E(GenStruct<bool, bool>),
    F(GenStructAliasBool),
    G(GenStructAliasBoolean),
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
        Struct { x, y } | Struct { x, y } | Struct { x: y, y: x } => if y { 0 } else { x },
    };

    let s4 = Struct::new();

    let _x = match s4 {
        Struct { x: a, y: b } | Struct { x: a, y: b } | Struct { x: b, y: a } => if b { 0 } else { a },
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

    let e3_no_error = Enum::A(false);

    // No error here.
    let _x = match e3_no_error {
        Enum::C(x) | Enum::D(x) => x.x,
        _ => false,
    };

    let e4_no_error = Enum::A(false);

    // No error here.
    let _x = match e4_no_error {
        Enum::E(x) | Enum::F(x) => x.x,
        _ => false,
    };

    let e5_no_error = Enum::A(false);

    // No error here.
    let _x = match e5_no_error {
        Enum::E(x) | Enum::G(x) => x.x,
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

    let t3 = (0u64, false, Struct::new(), Enum::A(true));

    let _x = match t3 {
        (x, y, Struct { x: a, y: b } | Struct { x: b, y: a }, _) => if y { 0 } else { x },
        _ => 0,
    };

    let t4 = (0u8, 0u16, 0u32, 0u64);

    let _x = match t4 {
        (x, y, _, _) | (y, x, _, _) => x + y,
    };

    let t5 = (0u8, 0u16, 0u32, 0u64);

    let _x = match t5 {
        (_, x, y, _) | (_, y, x, _) => x + y,
    };

    let t6 = (0u8, 0u16, 0u32, 0u64);

    let _x = match t6 {
        (_, _, x, y) | (_, _, y, x) => x + y,
    };

    poke(Enum::B(0));
    poke(Enum::C(Struct::new()));
    poke(Enum::D(Struct::new()));
    poke(Enum::E(GenStruct::new(true,true)));
    poke(Enum::F(GenStruct::new(true,true)));
    poke(Enum::G(GenStruct::new(true,true)));
    poke(Struct::new().use_me());
    poke(StructAlias::new().use_me());
    poke(GenStruct::new(0, 0).use_me());
    poke(GenStructAliasBool::new(true, true).use_me());
    poke(GenStructAliasBoolean::new(true, true).use_me());
}

fn poke<T>(_x: T) { }
