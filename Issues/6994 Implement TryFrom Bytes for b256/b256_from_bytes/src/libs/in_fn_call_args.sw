library;

use std::bytes::*;

fn fn_with_args(_a: b256, _b: b256) {}

pub fn global_fn_with_fn_with_args() {
    let bytes_in_fn_arg_a = Bytes::new();
    let bytes_in_fn_arg_b = Bytes::new();

    fn_with_args(b256::from(bytes_in_fn_arg_a), b256::from(bytes_in_fn_arg_b));
}
