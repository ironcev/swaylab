library;

struct Struct {
    x: bool,
    y: u32,
    z: (u32, u32, u32)
}

impl Struct {
    fn new() -> Self {
        Struct {
            x: false,
            y: 0,
            z: (0, 0, 0),
        }
    }

    fn use_me(self) -> () {
        poke(self.x);
        poke(self.y);
        poke(self.z);
    }
} 

enum Enum {
    A: (),
    B: (),
    C: (),
    D: (),
    E: u32,
}

pub fn play() -> () {
    let e = Enum::A;

    let _x = match e {
        Enum::A => 0,
        Enum::B => 0,
        Enum::C => 0,
        Enum::D => 0,
        Enum::E(_) => 0,
        _ => 0,
    };

    let _x = match e {
        Enum::A => 0,
        Enum::B => 0,
        Enum::C => 0,
        Enum::D => 0,
        Enum::E(_) => 0,
        x => { 
            poke(x);
            0
        },
    };

    let s = Struct::new();

    let _x = match s {
        Struct { x: true, y, z } => y + z.0,
        Struct { x: false, y, z } => y + z.0,
        _ => 0,
    };

    let _x = match s {
        Struct { x: true, y, z } => y + z.0,
        Struct { x: false, y, z } => y + z.0,
        x => {
            poke(x);
            0
        },
    };

    let _x = match s {
        Struct { x: true, y, z } => y + z.0,
        Struct { x: false, y, z } => y + z.0,
        Struct { x, y, z } => if x { y } else { z.0 },
    };

    let _x = match s {
        Struct { x: true, y, z } => y + z.0,
        Struct { x: false, y, z } => y + z.0,
        Struct { x:_, y:_, z:_ } => 0,
    };

    let _x = match s {
        Struct { x: true, y, z } => y + z.0,
        Struct { x: false, y, z } => y + z.0,
        Struct { x: a, y: b, z: c } => if a { b } else { c.0 },
    };

    let _x = match s {
        Struct { x: true, y, z } => y + z.0,
        Struct { x: false, y, z } => y + z.0,
        Struct { x: a, y: b, z: (j, k, l) } => if a { b } else { j + k + l },
    };

    let _x = match s {
        Struct { x: true, y, z } => y + z.0,
        Struct { x: false, y, z } => y + z.0,
        Struct { x: a, y: b, z: (_, _, _) } => if a { b } else { 0 },
    };

    // BUG: Non-exhaustive match expression. Missing patterns `Struct { x: _, y: _, z: _ }`
    // let _x = match s {
    //     Struct { x: true, y, z } => y + z.0,
    //     Struct { x: false, y, z } => y + z.0,
    //     Struct { x, .. } => if x { 1 } else { 0 },
    // };

    let _x = match s {
        Struct { x: true, y, z } => y + z.0,
        Struct { x: false, y, z } => y + z.0,
    };

    // BUG: Non-exhaustive match expression. Missing patterns `Struct { x: _, y: _, z: _ }`
    // let _x = match s {
    //     Struct { x: true, y, z } => y + z.0,
    //     Struct { x: false, y, z } => y + z.0,
    //     Struct { .. } => 0,
    // };
    
    let t = (false, Enum::A, Struct::new(), 0u32);

    let _x = match t {
        (true, _, s, n) => n + s.y,
        (false, _, s, n) => n + s.y,
        _ => 0,
    };

    let _x = match t {
        (true, _, s, n) => n + s.y,
        (false, _, s, n) => n + s.y,
        x => x.3,
    };

    let _x = match t {
        (true, _, s, n) => n + s.y,
        (false, _, s, n) => n + s.y,
        (b, e, s, n) => {
            poke(e);
            if b { s.y } else { n }
        },
    };

    let _x = match t {
        (true, _, s, n) => n + s.y,
        (false, _, s, n) => n + s.y,
        (_, _, _, _) => 0,
    };

    let _x = match t {
        (true, _, s, n) => n + s.y,
        (false, _, s, n) => n + s.y,
        (_, _, _, n) => n,
    };

    let _x = match t {
        (true, _, s, n) => n + s.y,
        (false, _, s, n) => n + s.y,
        (_, _, Struct { x, y, z: (j , k, l)}, n) => {
            poke(x);
            poke(y);
            poke(j);
            poke(k);
            poke(l);
            n
        },
    };

    let _x = match t {
        (true, _, s, n) => n + s.y,
        (false, _, s, n) => n + s.y,
        (_, _, Struct { x: _, y: _, z: (_ , k, _)}, n) => {
            poke(k);
            n
        },
    };

    poke(Enum::B);
    poke(Enum::C);
    poke(Enum::D);
    poke(Enum::E(0));
    poke(Struct::new().use_me());
}

fn poke<T>(x: T) -> () { let _ = x; () }
