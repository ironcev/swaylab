script;

mod lib;

use lib::*;

struct Struct {
    x: u8,
}

struct Struct { // Second definition.
    x: u8,
    y: u8,
}

struct Struct { // The last one wins.
    x: u8,
    y: u8,
    z: u8,
}

fn main() {
    let s = Struct { x: 0 };
    let _ = s.y;

    let s = Struct { x: 0, y: 0 };
    let _ = s.y;

    let s = Struct { x: 0, y: 0, z: 0 };
    let _ = s.y;

    let s = PubStruct { x: 0 };
    let _ = s.y;

    let s = PubStruct { x: 0, y: 0 };
    let _ = s.y;

    let s = PubStruct { x: 0, y: 0, z: 0 };
    let _ = s.y;
}
