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
    let or1 = Struct::new();
            
    let _x = match or1 {
        Struct { x: y, y: x, .. } | Struct { x, y, .. } => x,
    };
            
    poke(Struct::new().use_me());
}

fn poke<T>(_x: T) { }
