script;

mod lib;

use lib::*;

struct MainStruct {
    pub x: u64,
    y: u64,
}

struct EmptyStruct { }

fn main() {
    let ls = LibStruct { x: 0, y: 0, z: 0 };
    poke(ls.x);
    poke(ls.y);
    poke(ls.z);

    let mut ms = MainStruct { x: 0, y: 0, z: 0 };
    poke(ms.x);
    poke(ms.y);
    poke(ms.z);

    let es = EmptyStruct { x: 0 };
    poke(es.x);

    match ls {
        LibStruct { z, .. } => { },
        LibStruct { x, z, .. } => { },
    };

    let MainStruct { z } = ms;

    ms.z = 0;

    let ffs = FourFieldsStruct { x: 0, y: 0, z: 0, zz: 0 };
    poke(ffs.abc);

    let mfs = ManyFieldsStruct { x: 0, y: 0, z: 0, zz: 0, zzz: 0, zzzz: 0 };
    poke(mfs.abc);
}

fn poke<T>(_x: T) {}
