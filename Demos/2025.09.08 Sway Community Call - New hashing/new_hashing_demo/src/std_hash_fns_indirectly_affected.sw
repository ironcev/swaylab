library;

use std::hash::*;
use std::hash::sha256 as sha256_alias;
use std::hash::keccak256 as keccak256_alias;

use std::string::*;

use ::indirectly_affected_types::*;

pub fn play() -> u64 {
    let _ = sha256(StructC::new());
    let _ = sha256(StructBRec::new());
    let _ = sha256(EnumB::new());
    let _ = sha256(EnumCRec::new());
    let _ = sha256((0u8, 0u8, Vec::<u8>::new()));

    let _ = keccak256(EnumB::new());
    let _ = keccak256(EnumBRec::new());
    let _ = keccak256((0u8, [1, 2, 3]));

    42
}