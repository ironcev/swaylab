library;

use std::hash::sha256;
use std::hash::sha256 as sha256_alias;

use std::hash::keccak256;
use std::hash::keccak256 as keccak256_alias;

use std::b512::*;
use std::crypto::secp256k1::*;
use std::crypto::secp256r1::*;
use std::crypto::message::*;
use std::crypto::public_key::*;

pub fn play() -> u64 {
    let _ = sha256(0u8);
    let _ = sha256(b256::zero());
    let _ = sha256(true);
    let _ = sha256(Secp256k1::new());
    let _ = sha256(Secp256r1::new());
    let _ = sha256(Message::new());
    let _ = sha256(PublicKey::new());
    let _ = sha256(B512::zero());
    let _ = std::hash::sha256(0u8);
    let _ = std::hash::sha256(b256::zero());
    let _ = std::hash::sha256(true);
    let _ = std::hash::sha256(Secp256k1::new());
    let _ = std::hash::sha256(Secp256r1::new());
    let _ = std::hash::sha256(Message::new());
    let _ = std::hash::sha256(PublicKey::new());
    let _ = std::hash::sha256(B512::zero());

    let _ = sha256_alias(0u8);
    let _ = sha256_alias(b256::zero());
    let _ = sha256_alias(true);
    let _ = sha256_alias(Secp256k1::new());
    let _ = sha256_alias(Secp256r1::new());
    let _ = sha256_alias(Message::new());
    let _ = sha256_alias(PublicKey::new());
    let _ = sha256_alias(B512::zero());

    let _ = keccak256(0u8);
    let _ = keccak256(b256::zero());
    let _ = keccak256(true);
    let _ = keccak256(Secp256k1::new());
    let _ = keccak256(Secp256r1::new());
    let _ = keccak256(Message::new());
    let _ = keccak256(PublicKey::new());
    let _ = keccak256(B512::zero());
    let _ = std::hash::keccak256(0u8);
    let _ = std::hash::keccak256(b256::zero());
    let _ = std::hash::keccak256(true);
    let _ = std::hash::keccak256(Secp256k1::new());
    let _ = std::hash::keccak256(Secp256r1::new());
    let _ = std::hash::keccak256(Message::new());
    let _ = std::hash::keccak256(PublicKey::new());
    let _ = std::hash::keccak256(B512::zero());

    let _ = keccak256_alias(0u8);
    let _ = keccak256_alias(b256::zero());
    let _ = keccak256_alias(true);
    let _ = keccak256_alias(Secp256k1::new());
    let _ = keccak256_alias(Secp256r1::new());
    let _ = keccak256_alias(Message::new());
    let _ = keccak256_alias(PublicKey::new());
    let _ = keccak256_alias(B512::zero());

    42
}