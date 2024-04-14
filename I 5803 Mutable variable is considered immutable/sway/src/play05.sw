library;

type ArrayOfInt = [u64;3];

pub fn play() {
    let _ = match _ {
        _ => true,
    };

    let array_of_int: ArrayOfInt = [1u64, 2u64, 3u64];
    let _ = match array_of_int {
        _ => true,
    };
}

fn gfun<T>() {
    let _ = match T {
        _ => true,
    };
}

trait T { }

impl T for _ { }

trait Trait { }

impl Trait for T { }
