fn poke<T>(x: T) -> () { let _ = x; () }

enum Enum {
    A,
    B,
}

pub fn play() -> () {
    let e = Enum::A;

    let x = match e {
        Enum::A => 0,
        Enum::B => 0,
        _ => 0, // WARNING: unreachable pattern
    };

    poke(e);
    poke(x);
    poke(Enum::B);
}

fn main() {
}

// ------------------------------------------------

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
}

pub fn play() -> () {
    let s = Struct::new();

    let _x = match s {
        Struct { x: true, y, z } => y + z.0,
        Struct { x: false, y, z } => y + z.0,
        Struct { x, .. } => if x { 1 } else { 0 }, // WARNING: unreachable pattern
    };
}

fn main() {
}

// ------------------------------------------------

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
}

pub fn play() -> () {
    let s = Struct::new();

    let _x = match s {
        Struct { x, .. } => if x { 1 } else { 0 }, // ----- matches any value
        Struct { x: true, y, z } => y + z.0, // WARNING: unreachable pattern
    };
    
    let _x = match s {
        Struct { x, .. } => if x { 1 } else { 0 }, // ----- matches any value
        Struct { x: true, y, z } => y + z.0, // WARNING: unreachable pattern
    };    
}

fn main() {
}

// ------------------------------------------------

