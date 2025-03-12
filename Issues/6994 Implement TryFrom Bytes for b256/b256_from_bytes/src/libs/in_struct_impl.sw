library;

use std::bytes::*;

fn from(_bytes: Bytes) {}

struct S {}

impl S {
    pub fn assoc_fn() {
        let bytes_in_struct_assoc_fn = Bytes::new();
        let _ = b256::from(bytes_in_struct_assoc_fn);

        from(bytes_in_struct_assoc_fn);
    }

    pub fn method(self) {
        let _ = b256::from(Bytes::new());

        from(Bytes::new());
    }
}
