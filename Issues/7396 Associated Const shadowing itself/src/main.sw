library;

pub trait A {
    const C: bool;
}

struct S<T> { }

impl<T> A for S<T> where T: A {
    const C: bool = true;
}