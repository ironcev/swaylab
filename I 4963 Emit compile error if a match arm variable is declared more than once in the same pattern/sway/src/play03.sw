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

enum Enum {
    A: (),
    B: (),
    C: (),
    D: (),
    E: (u64, Struct),
}

pub fn play() -> () {
    let or1 = Struct::new();
            
    let _x = match or1 {
        Struct { x, y: x, z: x } | Struct { x, y: x, z: x } => x,
    };
            
    let or2 = (Struct::new(), Struct::new());
            
    let _x = match or2 {
        (Struct { x, .. } | Struct { x, .. }, Struct { x, .. } | Struct { x, .. }) => if x { 0 } else { 1 },
    };
            
    let or3 = Struct::new();
            
    let _x = match or3 {
        Struct { x: y | y | y, y, .. } | Struct { x: y | y | y, y, .. } => y,
    };

    let or4 = Enum::A;
            
    let _x = match or4 {
        Enum::E((1u64 | 2u64 | 3u64, Struct { x: true | false, ..})) => 0,
        Enum::E((y, Struct { x: y | y | y, .. })) => 0,
        _ => 0,
    };

    let or5 = Struct::new();
            
    let _x = match or5 {
        Struct { x, y: x, .. } | Struct { x, .. } => x,
        _ => 0,
    };

    let or6 = (0, Struct::new(), 0);

    let _x = match or6 {
        (x, Struct { x, .. } | Struct { x, .. }, y) => y,
        _ => 0,
    };

    let or7 = (0, Struct::new(), 0);

    let _x = match or7 {
        (0, Struct { x, y: x, .. } | Struct { x, .. }, x) => x,
        _ => 0,
    };

    let or8 = (0, Struct::new(), 0);

    let _x = match or8 {
        (x, Struct { x, y: x, .. } | Struct { x, .. }, x) => x,
        _ => 0,
    };

    poke(Enum::A);
    poke(Enum::B);
    poke(Enum::C);
    poke(Enum::D);
    poke(Enum::E((0, Struct::new())));
    poke(Struct::new().use_me());
}

fn poke<T>(_x: T) { }
