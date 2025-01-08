library;

pub struct Struct {
    x: u64,
}

pub struct PubStruct {
   x: u64,
}

pub struct GenericStruct<T> {
    x: T,
}

pub struct NameClashStruct {
    x: u64,
}

pub enum Enum {
    A: (),
}

pub const X: u64 = 0u64;