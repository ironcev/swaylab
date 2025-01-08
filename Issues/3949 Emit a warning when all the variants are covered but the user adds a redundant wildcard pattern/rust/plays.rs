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

// We will get the following error in the case of non-usage:
// 
// error[E0416]: identifier `a` is bound more than once in the same pattern
//  --> src/main.rs:35:27
//   |
//35 |         Struct { x: a, y: a, z: a } => 0,
//   |                           ^ used in a pattern more than once


// In the case of usage, the last bound identifier will tried to be used:
// error[E0308]: `match` arms have incompatible types
//  --> src/main.rs:36:40
//   |
//34 |       let _x = match s1 {
//   |  ______________-
//35 | |         Struct { x: a, y: a, z: a } => 0,
//   | |                                        - this is found to be of type `{integer}`
//36 | |         Struct { x: a, y: a, z: a } => a,
//   | |                                        ^ expected integer, found `(u32, u32, u32)`
//37 | |     };
//   | |_____- `match` arms have incompatible types
//   |
//   = note: expected type `{integer}`
//             found tuple `(u32, u32, u32)`


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
    let s1 = Struct::new();

    let _x = match s1 {
        Struct { x: a, y: a, z: a } => 0,
        Struct { x: a, y: a, z: a } => a,
    };
            
    let t1 = (false, Enum::A, Struct::new(), 0u32);

    let _x = match t1 {
        (a, a, a, a) => 0,
        (a, a, a, a) => a,
    };

    poke(Enum::A);
    poke(Enum::B);
    poke(Enum::C);
    poke(Enum::D);
    poke(Enum::E(0));
    poke(Struct::new().use_me());
}

fn poke<T>(x: T) -> () { let _ = x; () }

fn main() {
}

// ------------------------------------------------

