library;

use std::hash::sha256;
use std::hash::keccak256;

use std::bytes::*;

pub fn play() -> u64 {
    let _ = sha256("affected");
    let _ = sha256(Bytes::new());
    let _ = keccak256([1u8, 2u8, 3u8]);

    42
}