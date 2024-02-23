library;

struct S<T> {
    x: T,
}

pub fn play() {
    let r: S<Option<u8>>  = S { x: Option::Some(123) };
}
