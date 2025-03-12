library;

use std::bytes::*;

pub fn nested_b256_from_bytes() {
    let nested_bytes = Bytes::new();
    let _ = b256::from(Bytes::from(b256::from(nested_bytes)));
}
