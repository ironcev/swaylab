library;

use ::lib::Struct;

impl core::ops::Eq for [Struct;2] {
    fn eq(self, other: Self) -> bool {
        self[0] == other[0] && self[1] == other[1]
    }
}

pub fn play() {
    let mut a1: [Struct;2] = [Struct { b: false, x: 11, y: 22 }; 2];
    let mut a2: [Struct;2] = [Struct { b: true, x: 33, y: 44 }; 2];

    if a1 == a2 {
        poke(a1);
    } else {
        poke(a2);
    }
}

#[inline(never)]
fn poke<T>(_x: T) {}