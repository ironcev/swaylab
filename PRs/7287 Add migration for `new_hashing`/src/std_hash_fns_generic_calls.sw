library;

use std::hash::*;

pub fn play() -> u64 {
    generic_fn(0);
    generic_fn("generic affected");

    42
}

fn generic_fn<T>(x: T) where T: Hash {
    let _ = sha256(x);
    let _ = keccak256(x);
    let _ = { sha256(x); 1 } + 1;
    let _ = { keccak256(x); 1 } + 1;
}