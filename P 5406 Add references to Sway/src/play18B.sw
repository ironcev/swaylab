library;

use std::bytes_conversions::u256::*;

#[inline(never)]
pub fn play() {
    let mut bytes = std::bytes::Bytes::with_capacity(32);
    let mut i: u8 = 0;
    while i < 32_u8 {
        bytes.push(32_u8 - i);
        i += 1_u8;
    }

    let _ = u256::from_le_bytes(bytes);
}