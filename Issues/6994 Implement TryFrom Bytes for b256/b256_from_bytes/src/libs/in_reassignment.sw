library;

use std::bytes::*;

pub fn global_fn_with_reassignment() {
    let bytes_in_reassignment = Bytes::new();

    let mut val = b256::zero();
    val = b256::from(bytes_in_reassignment);
}
