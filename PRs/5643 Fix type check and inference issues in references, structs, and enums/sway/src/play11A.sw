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
    let _: MyStruct = Struct { x: 123 };

    let _: MyOtherStruct = Struct { x: 123 };

    let s: StructAlias<u8> = Struct { x: 123 };
    let _ = s.x == 123u8;

    let s: Struct<u8> = StructAlias { x: 123 };
    let _ = s.x == 123u8;

    let s: StructAlias<u8> = Struct { x: 123u64 };
    let _ = s.x == 123u8;

    let s: Struct<u8> = StructAlias { x: 123u64 };
    let _ = s.x == 123u8;

    let _: Struct<u8> = Struct { x: 123u64 };

    let _: Struct<u8> = Struct::<bool> { x: true };

    let _: Struct<u8> = Struct::<bool> { x: "not bool" };
}
