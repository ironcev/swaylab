struct S;

impl S {
    fn existing_associated() {}
    fn existing_method(self) {}
}

fn main() {
    S::associated();
    S {}.method();
    S::existing_associated(false);
    S {}.existing_method(false);
}

// error[E0599]: no function or associated item named `associated` found for struct `S` in the current scope
//  --> src/main.rs:9:8
//   |
// 1 | struct S;
//   | -------- function or associated item `associated` not found for this struct
// ...
// 9 |     S::associated();
//   |        ^^^^^^^^^^ function or associated item not found in `S`
//   |
// help: there is an associated function `existing_associated` with a similar name
//   |
// 9 |     S::existing_associated();
//   |        +++++++++

// error[E0599]: no method named `method` found for struct `S` in the current scope
//   --> src/main.rs:10:10
//    |
// 1  | struct S;
//    | -------- method `method` not found for this struct
// ...
// 10 |     S {}.method();
//    |          ^^^^^^ method not found in `S`

// error[E0061]: this function takes 0 arguments but 1 argument was supplied
//   --> src/main.rs:11:5
//    |
// 11 |     S::existing_associated(false);
//    |     ^^^^^^^^^^^^^^^^^^^^^^ ----- unexpected argument of type `bool`
//    |
// note: associated function defined here
//   --> src/main.rs:4:8
//    |
// 4  |     fn existing_associated() {}
//    |        ^^^^^^^^^^^^^^^^^^^
// help: remove the extra argument
//    |
// 11 -     S::existing_associated(false);
// 11 +     S::existing_associated();
//    |

// error[E0061]: this method takes 0 arguments but 1 argument was supplied
//   --> src/main.rs:12:10
//    |
// 12 |     S {}.existing_method(false);
//    |          ^^^^^^^^^^^^^^^ ----- unexpected argument of type `bool`
//    |
// note: method defined here
//   --> src/main.rs:5:8
//    |
// 5  |     fn existing_method(self) {}
//    |        ^^^^^^^^^^^^^^^
// help: remove the extra argument
//    |
// 12 -     S {}.existing_method(false);
// 12 +     S {}.existing_method();
//    |