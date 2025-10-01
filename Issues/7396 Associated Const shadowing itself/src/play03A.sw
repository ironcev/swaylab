library;

pub trait A {
    const C: bool;
}

struct S<T> { }

impl<T> S<T> where T: A {
    fn f() -> bool {
        true
    }
}

// error: Constants cannot be shadowed
//  --> /home/kebradalaonda/p/swaylab/Issues/7396 Associated Const shadowing itself/src/play03A.sw:4:11
//   |
// ...
// 4 |     const C: bool;
//   |           ^ Constant "C" shadows constant of the same name.
//   |           - info: Shadowed constant "C" is declared here.