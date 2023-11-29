script;

mod lib;

use std::hash::sha256;

use ::lib::{S, A};
// use ::lib::*;
// use std::hash::Hash;

fn main() {
    let _ = S { x: 0u8, y: A {}, z: A {} };

    let _ = sha256(0u8);
}
