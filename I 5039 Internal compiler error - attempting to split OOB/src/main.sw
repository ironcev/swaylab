script;

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

enum Enum {
    A: (),
    B: (u64, Struct),
}

fn main() {
    let or1 = Enum::A;
            
    // This compiles fine.
    let _x = match or1 {
        Enum::B((1u64 | 2u64 | 3u64, Struct { x: true | false, .. })) => 0,
        _ => 0,
    };

    let or2 = Enum::A;
            
    // This gives internal compiler error.
    let _x = match or2 {
        Enum::B((1u64 | 2u64 | 3u64, Struct { x: true | false, .. })) => 0,
        Enum::B((x | x | x, Struct { x: y | y | y, .. })) => 0,
        _ => 0,
    };

    poke(Enum::A);
    poke(Enum::B((0, Struct::new())));
    poke(Struct::new().use_me());
}

fn poke<T>(_x: T) { }
