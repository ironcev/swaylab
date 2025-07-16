library;

use std::hash::sha256;
use std::hash::sha256 as sha256_alias;

use std::hash::keccak256;
use std::hash::keccak256 as keccak256_alias;

use std::bytes::*;

pub fn play() -> u64 {
    let _ = sha256("affected");
    let _ = sha256("affected".as_raw_slice());
    let _ = sha256(__to_str_array("affected"));
    let _ = sha256([1u8, 2u8, 3u8]);
    let _ = sha256(Vec::<u8>::new());
    let _ = sha256(Bytes::new());
    let _ = std::hash::sha256("affected");
    let _ = std::hash::sha256("affected".as_raw_slice());
    let _ = std::hash::sha256(__to_str_array("affected"));
    let _ = std::hash::sha256([1u8, 2u8, 3u8]);

    let _ = sha256_alias("affected");
    let _ = sha256_alias("affected".as_raw_slice());
    let _ = sha256_alias(__to_str_array("affected"));
    let _ = sha256_alias([1u8, 2u8, 3u8]);

    let _ = keccak256("affected");
    let _ = keccak256("affected".as_raw_slice());
    let _ = keccak256(__to_str_array("affected"));
    let _ = keccak256([1u8, 2u8, 3u8]);
    let _ = std::hash::keccak256("affected");
    let _ = std::hash::keccak256("affected".as_raw_slice());
    let _ = std::hash::keccak256(__to_str_array("affected"));
    let _ = std::hash::keccak256([1u8, 2u8, 3u8]);

    let _ = keccak256_alias("affected");
    let _ = keccak256_alias("affected".as_raw_slice());
    let _ = keccak256_alias(__to_str_array("affected"));
    let _ = keccak256_alias([1u8, 2u8, 3u8]);

    42
}