const X: u64 = 123;

fn main() {
    let _ = &mut X;
    
    let a = 123u64;
    let _ = &mut a;
}

// warning: taking a mutable reference to a `const` item
//  --> src/main.rs:4:13
//   |
// 4 |     let _ = &mut X;
//   |             ^^^^^^
//   |
//   = note: each usage of a `const` item creates a new temporary
//   = note: the mutable reference will refer to this temporary, not the original `const` item
// note: `const` item defined here
//  --> src/main.rs:1:1
//   |
// 1 | const X: u64 = 123;
//   | ^^^^^^^^^^^^
//   = note: `#[warn(const_item_mutation)]` on by default
// 
// error[E0596]: cannot borrow `a` as mutable, as it is not declared as mutable
//  --> src/main.rs:7:13
//   |
// 7 |     let _ = &mut a;
//   |             ^^^^^^ cannot borrow as mutable
//   |
// help: consider changing this to be mutable
//   |
// 6 |     let mut a = 123u64;
//   |         +++
// 
// For more information about this error, try `rustc --explain E0596`.

