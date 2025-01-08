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

fn main() -> () {
    let or1 = Struct::new();
            
    let _x = match or1 {
        Struct { x: y, y: x, .. } | Struct { x, y, .. } => x, // ERROR: ^ expected `u64`, found `bool`
    };
            
    poke(Struct::new().use_me());
}

fn poke<T>(_x: T) { }

// error[E0308]: mismatched types
//   --> src/main.rs:27:46
//    |
// 26 |     let _x = match or1 {
//    |                    --- this expression has type `Struct`
// 27 |         Struct { x: y, y: x, .. } | Struct { x, y, .. } => x,
//    |                           -                  ^ expected `u64`, found `bool`
//    |                           |
//    |                           first introduced with type `u64` here
//    |
//    = note: in the same arm, a binding must have the same type in all alternatives
// 
// error[E0308]: mismatched types
//   --> src/main.rs:27:49
//    |
// 26 |     let _x = match or1 {
//    |                    --- this expression has type `Struct`
// 27 |         Struct { x: y, y: x, .. } | Struct { x, y, .. } => x,
//    |                     -                           ^ expected `bool`, found `u64`
//    |                     |
//    |                     first introduced with type `bool` here
//    |
//    = note: in the same arm, a binding must have the same type in all alternatives

// -----------------------------------------------------------------

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
    A,
    B,
    C,
    D,
    E(u64, Struct),
}

fn main() -> () {
    let s1 = Struct::new();

    let _x = match s1 {
        Struct { x: true, y: a_s1, z: a_s1 } => a_s1.0, // ERROR: used in a pattern more than once
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

    let t1 = (false, Enum::A, Struct::new(), 0u64, 0u64);

    let _x = match t1 {
        (true, a_t1, a_t1, a_t1, a_t1) => a_t1,
        (a_t1, a_t1, a_t1, a_t1, a_t1) => a_t1,
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
    poke(Enum::E(0, Struct::new()));
    poke(Struct::new().use_me());
}

fn poke<T>(_x: T) { }


// error[E0416]: identifier `a_s1` is bound more than once in the same pattern
//   --> src/main.rs:35:39
//    |
// 35 |         Struct { x: true, y: a_s1, z: a_s1 } => a_s1.0,
//    |                                       ^^^^ used in a pattern more than once
