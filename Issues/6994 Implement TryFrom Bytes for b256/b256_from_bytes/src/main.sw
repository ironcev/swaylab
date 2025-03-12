script;

pub mod libs;
pub mod lib_in_global_functions;

use std::bytes::*;

fn from(_bytes: Bytes) {}

fn main() -> b256 {
    let bytes_in_main = Bytes::new();
    let _ = b256::from(bytes_in_main);

    let num = u256::zero();
    let _ = b256::from(num);

    let other_in_main = b256::zero();
    let _ = b256::from(other_in_main);

    from(Bytes::new());

    b256::from(other_in_main)
}

abi Abi {
}

fn abi_cast() {
    let bytes_in_abi_cast = Bytes::new();
    let _ = abi(Abi, b256::from(bytes_in_abi_cast));
}
