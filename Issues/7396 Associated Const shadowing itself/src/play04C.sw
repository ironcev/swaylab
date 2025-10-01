library;

pub trait A {
    const C: bool;
}

pub trait B {
    const C: bool;
}

struct S<T> { }

impl<T> S<T> {
    fn f() -> bool where T: A + B {
        C
    }
}

// error: Constants cannot be shadowed
//  --> /home/kebradalaonda/p/swaylab/Issues/7396 Associated Const shadowing itself/src/play04C.sw:8:11
//   |
// ...
// 4 |     const C: bool;
//   |           - info: Shadowed constant "C" is declared here.
// ...
// 8 |     const C: bool;
//   |           ^ Constant "C" shadows constant of the same name.