library;

use ::lib01::PublicLib01Struct;
use ::lib01::lib01_nested::PublicLib01NestedStruct;

pub fn play() {
    let _ = PublicLib01Struct { x: 0, y: 0 };
    let _ = PublicLib01NestedStruct { x: 0, y: 0 };
}