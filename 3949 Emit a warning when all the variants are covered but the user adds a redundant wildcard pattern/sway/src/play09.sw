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
    let s1 = Struct::new();

    let _x = match s1 {
        Struct { x: a, y: a, z: a } => 0,
        Struct { x: a, y: a, z: a } => a,
        Struct { x: a, y: a, z: b } => a,
    };
            
    let t1 = (false, Enum::A, Struct::new(), 0u64, 0u32);

    let _x = match t1 {
        (a, a, a, a, a) => 0,
        (a, a, a, a, a) => a,
    };

    poke(Enum::A);
    poke(Enum::B);
    poke(Enum::C);
    poke(Enum::D);
    poke(Enum::E(0));
    poke(Struct::new().use_me());
}

fn poke<T>(x: T) -> () { let _ = x; () }
