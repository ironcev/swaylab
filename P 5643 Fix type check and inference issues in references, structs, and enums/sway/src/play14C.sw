library;

use ::lib_a::Struct;

pub fn play() {
    let s: Struct<u8> = Struct { x: 123u64 };
    let _ = s.x == 123u8;
    let _ = s.x == 123u64;

    let s = Abc { x: 123u64 };
    let _ = s.x == 123u8;

    let s: Abc = Struct { x: 123u64 };
    let _ = s.x == 123u64;

    let s: _ = Struct { x: 123u64 };
    let _ = s.x == 123u8;
    let _ = s.x == 123u64;

    let s = Struct { x: 123u64 };
    let _ = s.x == 123u8;
    let _ = s.x == 123u64;

    let s: Struct<u8> = Abc { x: 123u64 };
    let _ = s.x == 123u8;
    let _ = s.x == 123u64;
}
