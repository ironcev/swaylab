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
    let s1 = Struct::new();

    let _x = match s1 {
        Struct { x: true, y: a_s1, z: a_s1 } => a_s1.0,
        _ => 0,
    };

    let s2 = Struct::new();
            
    let _x = match s2 {
        Struct { x, y: x, z: x } => x.0,
    };

    let s3 = Struct::new();
            
    let _x = match s3 {
        Struct { x, y: x, .. } => x,
    };
            
    let s4 = (Struct::new(), Struct::new());
            
    let _x = match s4 {
        (Struct { y, .. }, Struct { y, .. }) => y,
    };

    let t1 = (false, Enum::A, Struct::new(), 0u64);

    let _x = match t1 {
        (true, a_t1, a_t1, a_t1) => a_t1,
        (a_t1, a_t1, a_t1, a_t1) => a_t1,
    };
            
    let t2 = (false, Enum::A, Struct::new(), 0u64, 0u64);

    let _x = match t2 {
        (true, a_t2, Struct { x, .. }, a_t2, x) => a_t2,
        _ => 0,
    };
            
    let t3 = (false, Enum::A, Struct::new(), 0u64, 0u64);

    let _x = match t3 {
        (x, a_t3, Struct { .. }, a_t2, x) => a_t2,
    };

    poke(Enum::A);
    poke(Enum::B);
    poke(Enum::C);
    poke(Enum::D);
    poke(Enum::E((0, Struct::new())));
    poke(Struct::new().use_me());
}

fn poke<T>(_x: T) { }
