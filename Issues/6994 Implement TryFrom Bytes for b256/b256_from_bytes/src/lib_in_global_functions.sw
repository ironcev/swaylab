library;

use std::bytes::*;

fn from(_bytes: Bytes) {}

pub fn global_fn_a() {
    let bytes_in_global_fn_a = Bytes::new();
    let _ = b256::from(bytes_in_global_fn_a);

    from(bytes_in_global_fn_a);
}

pub fn global_fn_b() {
    let _ = b256::from(Bytes::new());

    from(Bytes::new());
}
