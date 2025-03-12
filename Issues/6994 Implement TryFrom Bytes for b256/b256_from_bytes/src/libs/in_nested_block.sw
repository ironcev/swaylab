library;

use std::bytes::*;

pub fn global_fn_with_nested_block() {
    {
        let bytes_in_nested_block = Bytes::new();
        let _ = b256::from(bytes_in_nested_block);
    }
}
