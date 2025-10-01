library;

pub trait A {
    const C: bool;
}

struct S<T> { }

impl<T> S<T> {
    fn f() -> bool where T: A {
        T::C // Ok.
    }
}