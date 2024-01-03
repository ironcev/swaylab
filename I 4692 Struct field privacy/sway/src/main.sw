script;

mod lib01;
mod play01;

use lib01::*;
use lib01::lib01_nested::*;

fn main() {
    let _ = PublicLib01Struct { x: 0, y: 0 };
    let _ = PublicLib01NestedStruct { x: 0, y: 0 };

    ::play01::play();
}
