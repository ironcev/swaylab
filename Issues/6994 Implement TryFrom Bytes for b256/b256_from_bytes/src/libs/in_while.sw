library;

use std::bytes::*;

pub fn global_fn_with_while() {
    while true {
        let bytes_in_while = Bytes::new();
        let _ = b256::from(bytes_in_while);
    }
}
