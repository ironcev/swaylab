library;

pub trait A {
    const C: bool;
}

struct S<T> { }

impl<T> A for S<T> where T: A {
    const C: bool = true;
}

//  --> /home/kebradalaonda/p/swaylab/Issues/7396 Associated Const shadowing itself/src/play01A.sw:4:11
//   |
// ...
// 4 |     const C: bool;
//   |           ^ Constant "C" has the same name as an already declared constant.
//   |           - info: Constant "C" is already declared here.