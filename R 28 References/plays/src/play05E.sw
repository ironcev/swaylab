library;

struct S {
    b: bool,
    x: u32,
    y: u64,
}

pub fn play() -> u64 {
    let mut a: [S;2] = [S { b: false, x: 11, y: 22};2];

    let mut i = 0u32;
    while i < 2 {
        a[i].b = true;
        a[i].x = 42;
        a[i].y = 42;
        i = i + 1;
    }

    a[i.as_u64()].y
}