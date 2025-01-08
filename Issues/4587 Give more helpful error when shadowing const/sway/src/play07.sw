library;

pub fn play() -> () {
    struct Struct { } // Internal compiler error: Unexpected struct declaration found.

    impl Struct {
        const X: u32 = 1;
    }

    poke(Struct::X);
}

fn poke<T>(x: T) -> () { let _ = x; () }