struct S {
    x: u8,
}

const CONST_S: S = S { x: 0 };

pub fn play() {
    CONST_S.x = 1;

    const CONST: u8 = 0;
    // CONST = 1;

    let a = 0;
    // a = 1;

    let s = S { x: 0 };
    s.x = 1;

    let mut x = 0u8;

    *return_ref(&mut x) = 1;

    *if x > 0 { &mut x } else { &mut x } = 1;

    // if x > 0 { &mut x } else { &mut x } = 1;

    // (if x > 0 { &mut x } else { &mut x }) = 1;
}

fn return_ref<'a>(r_x: &'a mut u8) -> &'a mut u8 {
    r_x
}

// warning: attempting to modify a `const` item
//  --> src/play05A.rs:8:5
//   |
// 8 |     CONST_S.x = 1;
//   |     ^^^^^^^^^^^^^
//   |
//   = note: each usage of a `const` item creates a new temporary; the original `const` item will not be modified
// note: `const` item defined here
//  --> src/play05A.rs:5:1
//   |
// 5 | const CONST_S: S = S { x: 0 };
//   | ^^^^^^^^^^^^^^^^
//   = note: `#[warn(const_item_mutation)]` on by default


// error[E0070]: invalid left-hand side of assignment
//  --> src/play05A.rs:4:11
//   |
// 4 |     CONST = 1;
//   |     ----- ^
//   |     |
//   |     cannot assign to this expression


// error[E0384]: cannot assign twice to immutable variable `a`
//  --> src/play05A.rs:8:5
//   |
// 6 |     let a = 0;
//   |         -
//   |         |
//   |         first assignment to `a`
//   |         help: consider making this binding mutable: `mut a`
// 7 |
// 8 |     a = 1;
//   |     ^^^^^ cannot assign twice to immutable variable


// error[E0594]: cannot assign to `s.x`, as `s` is not declared as mutable
//   --> src/play05A.rs:17:5
//    |
// 17 |     s.x = 1;
//    |     ^^^^^^^ cannot assign
//    |
// help: consider changing this to be mutable
//    |
// 16 |     let mut s = S { x: 0 };
//    |         +++


// error: expected expression, found `=`
//   --> src/play05A.rs:24:41
//    |
// 24 |     if x > 0 { &mut x } else { &mut x } = 1;
//    |                                         ^ expected expression
//    |
// help: parentheses are required to parse this as an expression
//    |
// 24 |     (if x > 0 { &mut x } else { &mut x }) = 1;
//    |     +                                   +


// error[E0070]: invalid left-hand side of assignment
//   --> src/play05A.rs:24:41
//    |
// 24 |     if x > 0 { &mut x } else { &mut x } = 1;
//    |     ----------------------------------- ^
//    |     |
//    |     cannot assign to this expression
//    |
// help: consider dereferencing here to assign to the mutably borrowed value
//    |
// 24 |     *if x > 0 { &mut x } else { &mut x } = 1;
//    |     +


// error[E0070]: invalid left-hand side of assignment
//   --> src/play05A.rs:26:43
//    |
// 26 |     (if x > 0 { &mut x } else { &mut x }) = 1;
//    |     ------------------------------------- ^
//    |     |
//    |     cannot assign to this expression
//    |
// help: consider dereferencing here to assign to the mutably borrowed value
//    |
// 26 |     *(if x > 0 { &mut x } else { &mut x }) = 1;
