library;

struct S {
    x: u64,
    y: bool,
}

const CONST_1: S = S { x: 112233, y: true };
const CONST_2: S = S { x: 112233, y: true };

#[inline(never)]
pub fn play() {
    test();
}

#[test]
fn test() {
    let x = if CONST_1.y {
        poke(CONST_1, CONST_2);
        CONST_2.x
    } else {
        poke(CONST_1, CONST_2);
        CONST_1.x + CONST_2.x
    };

    poke(x, 0);
}

#[inline(never)]
fn poke<T>(_x: T, _y: T) {}