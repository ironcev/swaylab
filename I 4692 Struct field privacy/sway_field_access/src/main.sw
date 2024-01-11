script;

mod lib;

use lib::*;

struct MainStruct {
    pub x: u64,
    y: u64,
}

fn main() {
    let ls = LibStruct::new();
    poke(ls.x);
    poke(ls.y);

    let ms = MainStruct { x: 0, y: 0 };
    poke(ms.x);
    poke(ms.y);
}

fn poke<T>(_x: T) {}
