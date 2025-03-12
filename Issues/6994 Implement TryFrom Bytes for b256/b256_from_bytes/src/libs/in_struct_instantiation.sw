library;

use std::bytes::*;

struct S {
    field: b256,
}

fn new() -> S {
    let bytes_in_struct_instantiation = Bytes::new();
    S {
        field: b256::from(bytes_in_struct_instantiation),
    }
}
