library;

use std::bytes::*;

pub fn global_fn_with_parentheses() {
    let bytes_in_parentheses = Bytes::new();
    let _ = ((b256::from(bytes_in_parentheses)));
}
