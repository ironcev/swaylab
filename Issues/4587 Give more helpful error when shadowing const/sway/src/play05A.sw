library;

const X: u32 = 1;

pub fn play() -> () {
    {
        let X: u32 = 3; // ERR: The name `X` is defined multiple times
        poke(X);
    }
}

fn poke<T>(x: T) -> () { let _ = x; () }