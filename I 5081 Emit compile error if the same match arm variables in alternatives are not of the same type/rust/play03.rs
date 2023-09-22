struct Struct {
    x: u64,
    y: u64,
    z: u64,
}

impl Struct {
    fn new() -> Self {
        Self {
            x: 0,
            y: 0,
            z: 0,
        }
    }

    fn use_me(self) -> () {
        poke(self.x);
        poke(self.y);
        poke(self.z);
    }
}

fn main() {
    let s = Struct {
        x: 1,
        y: 2,
        z: 3,
    };

    let x = match s {
        Struct { x, y: 2, z: 3 } | Struct { x: 0, y: x, z: 0 } | Struct { x: 0, y: 0, z: x } => x,
        _ => 1111,
    };
    
    println!("{x}");

    let x = match s {
        Struct { x, y: 0, z: 0 } | Struct { x: 1, y: x, z: 3 } | Struct { x: 0, y: 0, z: x } => x,
        _ => 1111,
    };
    
    println!("{x}");

    let x = match s {
        Struct { x, y: 0, z: 0 } | Struct { x: 0, y: x, z: 0 } | Struct { x: 1, y: 2, z: x } => x,
        _ => 1111,
    };
    
    println!("{x}");

    let x = match s {
        Struct { x, y: 0, z: 0 } | Struct { x: 0, y: x, z: 0 } | Struct { x: 0, y: 0, z: x } => x,
        _ => 1111,
    };
    
    println!("{x}");

    let t = (1, 2, 3);

    let x = match t {
        (x, 2, 3) | (0, x, 0) | (0, 0, x) => x,
        _ => 1111,
    };
    
    println!("{x}");

    let x = match t {
        (x, 0, 0) | (1, x, 3) | (0, 0, x) => x,
        _ => 1111,
    };
    
    println!("{x}");

    let x = match t {
        (x, 0, 0) | (0, x, 0) | (1, 2, x) => x,
        _ => 1111,
    };
    
    println!("{x}");

    let x = match t {
        (x, 0, 0) | (0, x, 0) | (0, 0, x) => x,
        _ => 1111,
    };
    
    println!("{x}");
    
    poke(Struct::new().use_me());
}

fn poke<T>(_x: T) { }

