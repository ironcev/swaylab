library;

struct Struct { }

impl Struct {
    const X: u32 = 1;
    const X: u32 = 2;
}

pub fn play() -> () {
    poke(Struct::X);
}

fn poke<T>(x: T) -> () { let _ = x; () }