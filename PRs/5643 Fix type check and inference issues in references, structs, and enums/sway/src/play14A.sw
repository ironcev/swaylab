library;

use ::lib_a::Struct;

pub fn play() {
    let s: Struct<u8> = Struct { x: 123u64 };
    let _ = s.x == 123u8;
}
