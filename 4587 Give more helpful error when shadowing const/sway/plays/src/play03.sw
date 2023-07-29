library;

fn before_x() -> () {
    poke(X);
}

const X: u32 = 1;

pub fn play() -> () {
    before_x();
    after_x();
    poke(X);
    poke(Y);
}

const Y: u32 = 1;

fn after_x() -> () {
    poke(X);
}

fn poke<T>(x: T) -> () { let _ = x; () }
