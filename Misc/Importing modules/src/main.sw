script;

mod lib;
mod other_lib;

use lib::lib_a::*;
use lib::lib_b::*;

use ::core::str::*;

fn main() {
    // let s = S { a: 0 };
}

fn poke<T>(_x: T) {}

pub fn fn_in_main() {}