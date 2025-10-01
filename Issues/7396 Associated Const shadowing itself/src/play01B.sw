library;

pub trait A {
    const C: bool;
}

pub trait B {
    const C: bool;
}

struct S<T> { }

impl<T> A for S<T> where T: A + B {
    const C: bool = true;
}

// error: Constant of the same name already exists
//  --> /home/kebradalaonda/p/swaylab/Issues/7396 Associated Const shadowing itself/src/play01B.sw:8:11
//   |
// ...
// 4 |     const C: bool;
//   |           - info: Constant "C" is already declared here.
// ...
// 8 |     const C: bool;
//   |           ^ Constant "C" has the same name as an already declared constant.