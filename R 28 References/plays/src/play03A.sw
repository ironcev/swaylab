library;

struct S {
    b: bool,
    x: u32,
    y: u64,
}

pub fn play() -> u64 {
    let s = S { b: true, x: 32, y: 64 };
    
    if s.b {
        s.x.as_u64() + s.y
    }
    else {
        s.x.as_u64() - s.y
    }
}