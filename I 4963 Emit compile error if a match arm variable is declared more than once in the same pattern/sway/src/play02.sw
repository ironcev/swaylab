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
            
    // No error here.
    let _x = match or1 {
        Struct { x, .. } | Struct { x, .. } => x,
    };
            
    let or2 = (Struct::new(), Struct::new());
            
    // No error here.
    let _x = match or2 {
        (Struct { x, .. } | Struct { x, .. }, Struct { y, .. } | Struct { y, .. }) => if x { 0 } else { 1 } + y,
    };
            
    let or3 = Struct::new();
            
    // No error here.
    let _x = match or3 {
        Struct { x: y | y | y, .. } | Struct { x: y | y | y, .. } => y,
    };

    // TODO: Internal compiler error: attempting to split OOB
    // let or4 = Enum::A;
            
    // // No error here.
    // let _x = match or4 {
    //     Enum::E((1u64 | 2u64 | 3u64, Struct { x: true | false, ..})) => 0,
    //     Enum::E((x | x | x, Struct { x: y | y | y, .. })) => 0,
    //     _ => 0,
    // };

    let or4 = Enum::A;
            
    // No error here.
    let _x = match or4 {
        Enum::E((1u64 | 2u64 | 3u64, Struct { x: true | false, ..})) => 0,
        Enum::E((x, Struct { x: y | y | y, .. })) => 0,
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
