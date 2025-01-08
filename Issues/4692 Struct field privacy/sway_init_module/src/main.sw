script;

mod my;

use my::unique::path::to::std::vec::Vec;
use std::hash::core::ops::Eq;

fn main() -> u64 {
    let mut vec: my::Vec::<u64> = Vec::new();

    vec.push(42);

    my::assertive::std::assert::assert(vec.len() == 1);

    let popped = vec.pop().unwrap();
    
    my::other::way::to::std::assert::assert(popped == 42);

    popped
}