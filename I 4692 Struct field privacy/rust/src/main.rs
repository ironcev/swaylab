mod top;

use top::PublicTopStruct;

fn main() {
    top::middle::use_private_middle_struct();
    top::middle::bottom::use_private_bottom_struct();

    let s = PublicTopStruct { x: 0, y: 0 };
    // error[E0451]: field `y` of struct `PublicTopStruct` is private
    // --> src/main.rs:8:37
    //  |
    //8 |     let _ = PublicTopStruct { x: 0, y: 0 };
    //  |                                     ^^^^ private field
    //
    //For more information about this error, try `rustc --explain E0451`.

    let _ = s.y;
    // error[E0616]: field `y` of struct `PublicTopStruct` is private
    //  --> src/main.rs:17:15
    //   |
    //17 |     let _ = s.y;
    //   |               ^ private field
    //
    //For more information about this error, try `rustc --explain E0616`.

    let s = PublicTopStruct { x: 0 };
    //     error: cannot construct `PublicTopStruct` with struct literal syntax due to private fields
    //   --> src/main.rs:26:13
    //    |
    // 26 |     let s = PublicTopStruct { x: 0 };
    //    |             ^^^^^^^^^^^^^^^
    //    |
    //    = note: ... and other private field `y` that was not provided

    let s = PublicTopStruct { };
    //     error: cannot construct `PublicTopStruct` with struct literal syntax due to private fields
    //     --> src/main.rs:35:13
    //      |
    //   35 |     let s = PublicTopStruct { };
    //      |             ^^^^^^^^^^^^^^^
    //      |
    //      = note: ... and other private field `y` that was not provided

    let s = PublicTopStruct { nn: 123 };
    // error[E0560]: struct `PublicTopStruct` has no field named `nn`
    //     --> src/main.rs:44:31
    //      |
    //   44 |     let s = PublicTopStruct { nn: 123 };
    //      |                               ^^ `PublicTopStruct` does not have this field
    //      |
    //      = note: available fields are: `x`

    let s = PublicTopStruct { nn: 123, y: 0 };
}
