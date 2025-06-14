library;

pub fn play() -> u64 {
    let panic = true;
    let panic = panic;

    let mut panic = if panic {
        42
    } else {
        0
    };

    panic = panic;

    panic = 2 * panic + 1;

    panic += some_fn(panic);

    let panic = panic + panic;

    panic
}

struct SomeStruct {
    x: u64,
    panic: u64,
}

fn some_fn(x: u64) -> u64 {
    let mut panic = SomeStruct { x, panic: x };
    panic.x += panic.x;
    panic.panic += panic.panic;
    panic.x = panic.x;
    panic.panic = panic.panic;

    let mut panic = (x, x);
    panic.0 += panic.1;
    panic.0 = panic.1;

    let mut panic = [x, x];
    panic[0] += panic[1];
    panic[0] = panic[1];

    panic[0] + panic[1]
}
