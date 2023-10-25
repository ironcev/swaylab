library;

struct S {
    b: bool,
    x: u32,
    y: u64,
}

pub fn play() -> u64 {
    let mut a: [S;2] = [S { b: true, x: 32, y: 64};2];

    let mut i = 0u32;
    while i < 2 {
        a[i] = S { b: false, x: i, y: i.as_u64() };
        i = i + 1;
    }
    
    by_ref(a[1]).y
    //     ^^^^ Cannot pass immutable argument to mutable parameter.
}

#[inline(never)]
fn by_ref(ref mut value: S) -> S {
    S { b: true, x: value.x - 1, y: value.y + 1 }
}