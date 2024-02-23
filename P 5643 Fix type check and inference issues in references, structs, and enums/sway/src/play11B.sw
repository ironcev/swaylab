library;

use ::lib_a::Struct;
use ::lib_a::Struct as StructAlias;

struct MyStruct {
    x: u8,
}

struct MyOtherStruct {
    no_x: u8,
}

pub fn play() {
    let _: MyStruct = Struct { x: Option::Some(123) };

    let _: MyOtherStruct = Struct { x: Option::Some(123) };

    let s: StructAlias<Option<u8>> = Struct { x: Option::Some(123) };
    match s.x {
        Some(x) => x == 123u8,
        _ => false,
    };

    let s: Struct<Option<u8>> = Struct { x: Option::Some(123) };
    match s.x {
        Some(x) => x == 123u8,
        _ => false,
    };

    let s: Struct<Option<u8>> = Struct { x: Option::Some(123) };
    match s.x {
        Some(x) => assert(x == 123u8),
        _ => assert(false),
    };

    let s: Struct<Option<u8>> = StructAlias { x: Option::Some(123) };
    match s.x {
        Some(x) => x == 123u8,
        _ => false,
    };

    let s: StructAlias<Option<u8>> = Struct { x: Option::Some(123u64) };
    match s.x {
        Some(x) => x == 123u8,
        _ => false,
    };

    let s: Struct<Option<u8>> = StructAlias { x: Option::Some(123u64) };
    match s.x {
        Some(x) => x == 123u8,
        _ => false,
    };

    let _: Struct<Option<u8>> = Struct { x: Option::Some(123u64) };

    let _: Struct<Option<u8>> = Struct::<Option<bool>> { x: Option::Some(true) };

    let _: Struct<Option<u8>> = Struct::<Option<bool>> { x: Option::Some("not bool") };
}
