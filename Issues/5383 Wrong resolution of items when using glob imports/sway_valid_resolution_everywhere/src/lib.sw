library;

pub struct Struct {
    x: u64,
    z: u64,
}

pub struct GenericStruct<T> {
    x: T,
    z: T,
}

pub enum Enum {
    A: (),
    C: (),
}

pub const X: u64 = 0u64;