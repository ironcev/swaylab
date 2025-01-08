struct S {
    x: u8,
}

pub fn play() {
    let mut x = S { x: 0u8 };

    let r_x_1 = &mut x;

    r_x_1 = S { x: 1u8 };
}

// error[E0308]: mismatched types
//   --> src/play02A.rs:10:13
//    |
// 8  |     let r_x_1 = &mut x;
//    |                 ------ expected due to this value
// 9  |
// 10 |     r_x_1 = S { x: 1u8 };
//    |             ^^^^^^^^^^^^ expected `&mut S`, found `S`
//    |
// help: consider dereferencing here to assign to the mutably borrowed value
//    |
// 10 |     *r_x_1 = S { x: 1u8 };
//    |     +