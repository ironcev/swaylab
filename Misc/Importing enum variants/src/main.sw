script;

mod lib;
mod lib_a;
mod lib_b;
mod traits;
mod structs;

// use lib::E;
// use lib::E::{self, *};
// use lib::*;
// use lib::E::*;

// use lib::X;

use traits::*;

struct X { }

impl Trait for X {
    type T = bool;
}

use structs::Struct;

fn main() {
    let _: <X as Trait>::T = true;
    // use lib_a::S;

    // let _ = S { a: true };

    // use lib_b::S;

    // {
    //     use lib_b::S;
    //     let _ = S { b: 0 };
    // }
    // let _ = X;
    // poke(X);
    // let _ = E::A;
    // let _ = A;

    // {
    //     use lib::E::{self, *};
    //     let _x = E::A;
    //     let _x = A;
    // }
}

fn poke<T>(_x: T) {}