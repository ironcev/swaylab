library;

struct Struct {
    x: bool,
    y: u64,
    z: (u64, u64, u64)
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

pub fn play() -> () {
    let s = Struct::new();

    // OK: Match expression is exhaustive.
    let _x = match s {
        Struct { x: true, y, z } => y + z.0,
        Struct { x: false, y, z } => y + z.0,
    };

    // OK WARNING: This match arm is unreachable.
    let _x = match s {
        Struct { x: true, y, z } => y + z.0,
        Struct { x: false, y, z } => y + z.0,
        Struct { x: _, y: _, z: _ } => 0,
    };

    // OK WARNING: This match arm is unreachable.
    let _x = match s {
        Struct { x: true, y, z } => y + z.0,
        Struct { x: false, y, z } => y + z.0,
        Struct { x, y, z } => 0,
    };

    // FALSE ERROR: Non-exhaustive match expression. Missing patterns `Struct { x: _, y: _, z: _ }`
    let _x = match s {
        Struct { x: true, y, z } => y + z.0,
        Struct { x: false, y, z } => y + z.0,
        Struct { .. } => 0,
    };

    // FALSE ERROR: Non-exhaustive match expression. Missing patterns `Struct { x: _, y: _, z: _ }`
    let _x = match s {
        Struct { x: true, y, z } => y + z.0,
        Struct { x: false, y, z } => y + z.0,
        Struct { x, .. } => 0,
    };

    // FALSE ERROR: Non-exhaustive match expression. Missing patterns `Struct { x: _, y: _, z: _ }`
    let _x = match s {
        Struct { x: true, y, z } => y + z.0,
        Struct { x, .. } => 0,
    };

    // OK: Match expression is exhaustive.
    let _x = match s {
        Struct { .. } => 0,
    };

    // FALSE ERROR: Non-exhaustive match expression. Missing patterns `Struct { x: _ }`
    let _x = match s {
        Struct { x, .. } => 0,
        Struct { x: true, y, z } => y + z.0,
    };

    poke(Struct::new().use_me());
}

fn poke<T>(x: T) -> () { let _ = x; () }
