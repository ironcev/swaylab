library;

struct S {
    x: u8,
    y: u8,
}

pub fn play() {
    let a = 123;

    let _ = &mut a;

    let _ = &mut { a };

    let S { x, y } = S { x: 0, y: 0 };

    let _ = &mut x;
    let _ = &mut y;

    let S { x: x, y: y } = S { x: 0, y: 0 };

    let _ = &mut x;
    let _ = &mut y;

    let S { x: x_1, y: y_1 } = S { x: 0, y: 0 };

    let _ = &mut x_1;
    let _ = &mut y_1;

    let mut S { x, y } = S { x: 0, y: 0 };
    //        ^^^^^^^^ Expected `=`.

    let _ = &mut x;
    let _ = &mut y;

    let s = S { x: 0, y: 0};
    let _ = match s {
        S { x, .. } => {
            let _ = &mut x;
        },
        S { x: x, .. } => {
            let _ = &mut x;
        },
        S { x: x_1, .. } => {
            let _ = &mut x_1;
        },
    };

    if let S { x, y } = s {
        let _ = &mut x;
    }

    let vec = Vec::<u64>::new();

    for n in vec.iter() {
        let _ = &mut n;
    }
}
