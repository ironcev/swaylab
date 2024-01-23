contract;

mod lib;

use lib::*;

struct MainStruct {
    pub x: u64,
    y: u64,
    other: MainOtherStruct,
}

struct MainOtherStruct {
    pub x: u64,
    y: u64,
}

storage {
    a: u8 = 123,
    b: bool = true,
    ms: MainStruct = MainStruct { x: 0, y: 0, other: MainOtherStruct { x: 0, y: 0 } },
    // ms_no_init: MainStruct,
    //                    ^ Expected `=`.
    ls: LibStruct = LibStruct { },
    los: LibOtherStruct = LibOtherStruct { y: 0 },
}

#[storage(read)]
fn read_storage() {
    let _ = storage.a.read();
//    let _ = storage.a.bla.read();
    let _ = storage.ls.x.read();
    let _ = storage.ls.y.read();
    let _ = storage.ls.other.read();
    let _ = storage.ls.other.x.read();
    let _ = storage.ls.other.y.read();

    let a = 0u8;
    poke(a.bla);
}

fn poke<T>(_x: T) {}
