mod top;

use top::PublicTopStruct;

fn main() {
    top::middle::use_private_middle_struct();

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
}
