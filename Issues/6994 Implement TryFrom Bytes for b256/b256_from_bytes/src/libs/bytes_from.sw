library;

use std::bytes::*;

pub fn bytes_from_b256() {
    let _bytes_from_b256 = Bytes::from(b256::zero());
}

pub fn bytes_from_raw_slice() {
    let _bytes_from_raw_slice = Bytes::from(Vec::<u64>::new().as_raw_slice());
}

pub fn b256_from_bytes() {
    let _b256_from_bytes = b256::from(Bytes::new());
}
