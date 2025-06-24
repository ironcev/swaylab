script;

use std::hash::*;
use std::vec::Vec;
use std::bytes::Bytes;

// Bytecode size:
// 9560
// 8584
fn main() {
    hashing_with_new_hasher_for_every_type();
    hashing_with_shared_hasher();
}

// Gas usage:
// 35826
// 20267
#[test]
fn test_hashing_with_new_hasher_for_every_type() {
    hashing_with_new_hasher_for_every_type();
}

// Gas usage:
// 15562
#[test]
fn test_hashing_with_new_hasher_for_every_type_with_capacity() {
    hashing_with_new_hasher_for_every_type_with_capacity();
}

// Gas usage:
// 34951
// 13870
#[test]
fn test_hashing_with_shared_hasher() {
    hashing_with_shared_hasher();
}

// Gas usage:
// 14443
#[test]
fn test_hashing_with_shared_hasher_with_capacity() {
    hashing_with_shared_hasher_with_capacity();
}

fn hashing_with_new_hasher_for_every_type() {
    // This function simulates creation of a byte stream to hash
    // for every individual type.
    let mut hasher = Hasher::new();
    0_u8.hash(hasher);

    let mut hasher = Hasher::new();
    0_u16.hash(hasher);

    let mut hasher = Hasher::new();
    0_u32.hash(hasher);

    let mut hasher = Hasher::new();
    0_u64.hash(hasher);

    let mut hasher = Hasher::new();
    0_u256.hash(hasher);

    let mut hasher = Hasher::new();
    0x0000000000000000000000000000000000000000000000000000000000000000.hash(hasher);

    let mut hasher = Hasher::new();
    false.hash(hasher);

    let mut hasher = Hasher::new();
    "Fastest Modular Execution Layer!".hash(hasher);

    let mut hasher = Hasher::new();
    ().hash(hasher);

    let mut hasher = Hasher::new();
    (0_u8, 0_u8, 0_u8).hash(hasher);

    let mut hasher = Hasher::new();
    (0_u64, 0_u64, 0_u64).hash(hasher);

    let mut hasher = Hasher::new();
    (0_u256, 0_u256, 0_u256).hash(hasher);

    let mut hasher = Hasher::new();
    [0_u8, 0_u8, 0_u8, 0_u8, 0_u8].hash(hasher);

    let mut hasher = Hasher::new();
    [0_u64, 0_u64, 0_u64, 0_u64, 0_u64].hash(hasher);

    let mut hasher = Hasher::new();
    [0_u256, 0_u256, 0_u256, 0_u256, 0_u256].hash(hasher);

    let mut bytes = Bytes::new();
    let mut i = 0;
    while i < 32 {
        bytes.push(0_u8);
        i += 1;
    }

    let mut hasher = Hasher::new();
    bytes.hash(hasher);

    let mut vec = Vec::<u8>::new();
    let mut i = 0;
    while i < 10 {
        vec.push(0_u8);
        i += 1;
    }

    let mut hasher = Hasher::new();
    vec.hash(hasher);

    let mut vec = Vec::<u64>::new();
    let mut i = 0;
    while i < 10 {
        vec.push(0_u64);
        i += 1;
    }

    let mut hasher = Hasher::new();
    vec.hash(hasher);

    let mut vec = Vec::<u256>::new();
    let mut i = 0;
    while i < 10 {
        vec.push(0_u256);
        i += 1;
    }

    let mut hasher = Hasher::new();
    vec.hash(hasher);
}

fn hashing_with_new_hasher_for_every_type_with_capacity() {
    // This function simulates creation of a byte stream to hash
    // for every individual type.
    let mut hasher = Hasher::with_capacity(1);
    0_u8.hash(hasher);

    let mut hasher = Hasher::with_capacity(2);
    0_u16.hash(hasher);

    let mut hasher = Hasher::with_capacity(4);
    0_u32.hash(hasher);

    let mut hasher = Hasher::with_capacity(8);
    0_u64.hash(hasher);

    let mut hasher = Hasher::with_capacity(32);
    0_u256.hash(hasher);

    let mut hasher = Hasher::with_capacity(32);
    0x0000000000000000000000000000000000000000000000000000000000000000.hash(hasher);

    let mut hasher = Hasher::with_capacity(1);
    false.hash(hasher);

    let mut hasher = Hasher::with_capacity(32);
    "Fastest Modular Execution Layer!".hash(hasher);

    let mut hasher = Hasher::with_capacity(0);
    ().hash(hasher);

    let mut hasher = Hasher::with_capacity(3*1);
    (0_u8, 0_u8, 0_u8).hash(hasher);

    let mut hasher = Hasher::with_capacity(3*8);
    (0_u64, 0_u64, 0_u64).hash(hasher);

    let mut hasher = Hasher::with_capacity(3*32);
    (0_u256, 0_u256, 0_u256).hash(hasher);

    let mut hasher = Hasher::with_capacity(5*1);
    [0_u8, 0_u8, 0_u8, 0_u8, 0_u8].hash(hasher);

    let mut hasher = Hasher::with_capacity(5*8);
    [0_u64, 0_u64, 0_u64, 0_u64, 0_u64].hash(hasher);

    let mut hasher = Hasher::with_capacity(5*32);
    [0_u256, 0_u256, 0_u256, 0_u256, 0_u256].hash(hasher);

    let mut bytes = Bytes::new();
    let mut i = 0;
    while i < 32 {
        bytes.push(0_u8);
        i += 1;
    }

    let mut hasher = Hasher::with_capacity(__size_of::<Bytes>());
    bytes.hash(hasher);

    let mut vec = Vec::<u8>::new();
    let mut i = 0;
    while i < 10 {
        vec.push(0_u8);
        i += 1;
    }

    let mut hasher = Hasher::with_capacity(__size_of::<Vec<u8>>());
    vec.hash(hasher);

    let mut vec = Vec::<u64>::new();
    let mut i = 0;
    while i < 10 {
        vec.push(0_u64);
        i += 1;
    }

    let mut hasher = Hasher::with_capacity(__size_of::<Vec<u64>>());
    vec.hash(hasher);

    let mut vec = Vec::<u256>::new();
    let mut i = 0;
    while i < 10 {
        vec.push(0_u256);
        i += 1;
    }

    let mut hasher = Hasher::with_capacity(__size_of::<Vec<u256>>());
    vec.hash(hasher);
}

fn hashing_with_shared_hasher() {
    // This function simulates creation of a byte stream to hash
    // a single complex type like a struct.
    let mut hasher = Hasher::new();
    0_u8.hash(hasher);
    0_u16.hash(hasher);
    0_u32.hash(hasher);
    0_u64.hash(hasher);
    0_u256.hash(hasher);
    0x0000000000000000000000000000000000000000000000000000000000000000.hash(hasher);
    false.hash(hasher);
    "Fastest Modular Execution Layer!".hash(hasher);
    ().hash(hasher);
    (0_u8, 0_u8, 0_u8).hash(hasher);
    (0_u64, 0_u64, 0_u64).hash(hasher);
    (0_u256, 0_u256, 0_u256).hash(hasher);
    [0_u8, 0_u8, 0_u8, 0_u8, 0_u8].hash(hasher);
    [0_u64, 0_u64, 0_u64, 0_u64, 0_u64].hash(hasher);
    [0_u256, 0_u256, 0_u256, 0_u256, 0_u256].hash(hasher);

    let mut bytes = Bytes::new();
    let mut i = 0;
    while i < 32 {
        bytes.push(0_u8);
        i += 1;
    }

    bytes.hash(hasher);

    let mut vec = Vec::<u8>::new();
    let mut i = 0;
    while i < 10 {
        vec.push(0_u8);
        i += 1;
    }

    vec.hash(hasher);

    let mut vec = Vec::<u64>::new();
    let mut i = 0;
    while i < 10 {
        vec.push(0_u64);
        i += 1;
    }

    vec.hash(hasher);

    let mut vec = Vec::<u256>::new();
    let mut i = 0;
    while i < 10 {
        vec.push(0_u256);
        i += 1;
    }

    vec.hash(hasher);
}

fn hashing_with_shared_hasher_with_capacity() {
    // This function simulates creation of a byte stream to hash
    // a single complex type like a struct.
    let mut hasher = Hasher::with_capacity(
        1+2+4+8+32+32+1+32+0+3*1+3*8+3*32+5*1+5*8+5*32
        + __size_of::<Bytes>()
        + __size_of::<Vec<u8>>()
        + __size_of::<Vec<u64>>()
        + __size_of::<Vec<u256>>());

    0_u8.hash(hasher);
    0_u16.hash(hasher);
    0_u32.hash(hasher);
    0_u64.hash(hasher);
    0_u256.hash(hasher);
    0x0000000000000000000000000000000000000000000000000000000000000000.hash(hasher);
    false.hash(hasher);
    "Fastest Modular Execution Layer!".hash(hasher);
    ().hash(hasher);
    (0_u8, 0_u8, 0_u8).hash(hasher);
    (0_u64, 0_u64, 0_u64).hash(hasher);
    (0_u256, 0_u256, 0_u256).hash(hasher);
    [0_u8, 0_u8, 0_u8, 0_u8, 0_u8].hash(hasher);
    [0_u64, 0_u64, 0_u64, 0_u64, 0_u64].hash(hasher);
    [0_u256, 0_u256, 0_u256, 0_u256, 0_u256].hash(hasher);

    let mut bytes = Bytes::new();
    let mut i = 0;
    while i < 32 {
        bytes.push(0_u8);
        i += 1;
    }

    bytes.hash(hasher);

    let mut vec = Vec::<u8>::new();
    let mut i = 0;
    while i < 10 {
        vec.push(0_u8);
        i += 1;
    }

    vec.hash(hasher);

    let mut vec = Vec::<u64>::new();
    let mut i = 0;
    while i < 10 {
        vec.push(0_u64);
        i += 1;
    }

    vec.hash(hasher);

    let mut vec = Vec::<u256>::new();
    let mut i = 0;
    while i < 10 {
        vec.push(0_u256);
        i += 1;
    }

    vec.hash(hasher);
}

// Gas usage:
// 3474
#[test]
fn baseline() {
    let mut bytes = Bytes::new();
    let mut i = 0;
    while i < 32 {
        bytes.push(0_u8);
        i += 1;
    }

    let mut vec = Vec::<u8>::new();
    let mut i = 0;
    while i < 10 {
        vec.push(0_u8);
        i += 1;
    }

    let mut vec = Vec::<u64>::new();
    let mut i = 0;
    while i < 10 {
        vec.push(0_u64);
        i += 1;
    }

    let mut vec = Vec::<u256>::new();
    let mut i = 0;
    while i < 10 {
        vec.push(0_u256);
        i += 1;
    }
}