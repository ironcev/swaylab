script;

use std::hash::*;

struct S {
    a: u32,
    b: u32,
    c: b256,
}

fn main() {
    let s = S {
        a: 1,
        b: 2,
        c: b256::from(3),
    };
    // poke(sha256(s));
    poke(sha256::<S>(s));

    // poke(sha256(123u64));

    // poke(sha256_str_array(__to_str_array("Hello, World!")));
    // poke(sha256_str_array(__to_str_array("")));
}

#[inline(never)]
fn poke<T>(_t: T) {}