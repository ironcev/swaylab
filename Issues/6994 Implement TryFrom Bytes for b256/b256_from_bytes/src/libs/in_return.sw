library;

use std::bytes::*;

pub fn global_fn_with_return() -> b256 {
    let bytes_in_return = Bytes::new();
    return b256::from(bytes_in_return);
}
