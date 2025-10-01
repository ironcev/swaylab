library;

pub trait A {
    const C: bool;
}

struct S<T> { }

impl<T> A for S<T> where T: A {
}

//  --> /home/kebradalaonda/p/swaylab/Issues/7396 Associated Const shadowing itself/src/play02A.sw:4:11
//   |
// ...
// 4 |     const C: bool;
//   |           ^ Constant "C" has the same name as an already declared constant.
//   |           - info: Constant "C" is already declared here.
//   |
//   = help: Consider renaming one of the constants, or in case of imported constants, using an alias.
// ____

// error
//   --> /home/kebradalaonda/p/swaylab/Issues/7396 Associated Const shadowing itself/src/play02A.sw:9:1
//    |
//  7 |   struct S<T> { }
//  8 |   
//  9 | / impl<T> A for S<T> where T: A {
// 10 | | }
//    | |_^ Constants are missing from this trait implementation: C