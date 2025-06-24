use bincode::Options;
use sha2::{Digest, Sha256};
use tiny_keccak::{Hasher, Keccak};
use serde::Serialize;
use hex::encode;

fn hash_and_print<T: Serialize>(type_name: &str, value: &T) {
    let bytes = bincode::options()
        .with_big_endian()
        .with_fixint_encoding()
        .serialize(value)
        .unwrap();

    let mut sha = Sha256::new();
    sha.update(&bytes);
    let sha_out_hex = encode(sha.finalize());

    let mut keccak = Keccak::v256();
    let mut keccak_out = [0u8; 32];
    keccak.update(&bytes);
    keccak.finalize(&mut keccak_out);
    let keccak_out_hex = encode(keccak_out);

    println!("{type_name}\n  SHA-256   : {sha_out_hex}\n  Keccak-256: {keccak_out_hex}\n");
}

fn main() {
    let value: (u8,)                        = (0,);
    hash_and_print("u8",                 &value);
    let value: (u8,)                        = (1,);
    hash_and_print("u8",                 &value);
    let value: (u8,)                        = (42,);
    hash_and_print("u8",                 &value);
    let value: (u8,)                        = (u8::MAX,);
    hash_and_print("u8",                 &value);

    let value: (u16,)                        = (0,);
    hash_and_print("u16",                 &value);
    let value: (u16,)                        = (1,);
    hash_and_print("u16",                 &value);
    let value: (u16,)                        = (42,);
    hash_and_print("u16",                 &value);
    let value: (u16,)                        = (u16::MAX,);
    hash_and_print("u16",                 &value);

    let value: (u32,)                        = (0,);
    hash_and_print("u32",                 &value);
    let value: (u32,)                        = (1,);
    hash_and_print("u32",                 &value);
    let value: (u32,)                        = (42,);
    hash_and_print("u32",                 &value);
    let value: (u32,)                        = (u32::MAX,);
    hash_and_print("u32",                 &value);

    let value: (u64,)                        = (0,);
    hash_and_print("u64",                 &value);
    let value: (u64,)                        = (1,);
    hash_and_print("u64",                 &value);
    let value: (u64,)                        = (42,);
    hash_and_print("u64",                 &value);
    let value: (u64,)                        = (u64::MAX,);
    hash_and_print("u64",                 &value);

    let value: (u128, u128)                        = (0, 0);
    hash_and_print("u256",                 &value);
    let value: (u128, u128)                        = (0, 1);
    hash_and_print("u256",                 &value);
    let value: (u128, u128)                        = (0, 42);
    hash_and_print("u256",                 &value);
    let value: (u128, u128)                        = (u128::MAX, u128::MAX);
    hash_and_print("u256",                 &value);

    let value: ()                        = ();
    hash_and_print("()",                 &value);

    let value: (u64, u64)                        = (0, 0);
    hash_and_print("(u64, u64)",                 &value);
    let value: (u64, u64)                        = (1, 1);
    hash_and_print("(u64, u64)",                 &value);

    let value: (u64, u64, u64)                        = (0, 0, 0);
    hash_and_print("(u64, u64, u64)",                 &value);
    let value: (u64, u64, u64)                        = (1, 1, 1);
    hash_and_print("(u64, u64, u64)",                 &value);

    let value: (u64, u64, u64, u64)                        = (0, 0, 0, 0);
    hash_and_print("(u64, u64, u64, u64)",                 &value);
    let value: (u64, u64, u64, u64)                        = (1, 1, 1, 1);
    hash_and_print("(u64, u64, u64, u64)",                 &value);

    let value: (u64, u64, u64, u64, u64)                        = (0, 0, 0, 0, 0);
    hash_and_print("(u64, u64, u64, u64, u64)",                 &value);
    let value: (u64, u64, u64, u64, u64)                        = (1, 1, 1, 1, 1);
    hash_and_print("(u64, u64, u64, u64, u64)",                 &value);

    let value: (u64, u64, u64, u64, u64, u64)                        = (0, 0, 0, 0, 0, 0);
    hash_and_print("[u64; 6]",                 &value);
    let value: (u64, u64, u64, u64, u64, u64)                        = (1, 1, 1, 1, 1, 1);
    hash_and_print("[u64; 6]",                 &value);

    let value: (u64, u64, u64, u64, u64, u64, u64)                        = (0, 0, 0, 0, 0, 0, 0);
    hash_and_print("[u64; 7]",                 &value);
    let value: (u64, u64, u64, u64, u64, u64, u64)                        = (1, 1, 1, 1, 1, 1, 1);
    hash_and_print("[u64; 7]",                 &value);

    let value: (u64, u64, u64, u64, u64, u64, u64, u64)                        = (0, 0, 0, 0, 0, 0, 0, 0);
    hash_and_print("[u64; 8]",                 &value);
    let value: (u64, u64, u64, u64, u64, u64, u64, u64)                        = (1, 1, 1, 1, 1, 1, 1, 1);
    hash_and_print("[u64; 8]",                 &value);

    let value: (u64, u64, u64, u64, u64, u64, u64, u64, u64)                        = (0, 0, 0, 0, 0, 0, 0, 0, 0);
    hash_and_print("[u64; 9]",                 &value);
    let value: (u64, u64, u64, u64, u64, u64, u64, u64, u64)                        = (1, 1, 1, 1, 1, 1, 1, 1, 1);
    hash_and_print("[u64; 9]",                 &value);

    let value: (u64, u64, u64, u64, u64, u64, u64, u64, u64, u64)                        = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    hash_and_print("[u64; 10]",                 &value);
    let value: (u64, u64, u64, u64, u64, u64, u64, u64, u64, u64)                        = (1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
    hash_and_print("[u64; 10]",                 &value);

    let value: (u8, u8, u8, u8, u8, u8, u8, u8, u8, u8)                        = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    hash_and_print("Bytes 10",                 &value);
    let value: (u8, u8, u8, u8, u8, u8, u8, u8, u8, u8)                        = (1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
    hash_and_print("Bytes 10",                 &value);

    let value: (u8, u128, u128)                        = (0, 0, 0);
    hash_and_print("Identity::Address",                 &value);
    let value: (u8, u128, u128)                        = (0, 0, 1);
    hash_and_print("Identity::Address",                 &value);
    let value: (u8, u128, u128)                        = (0, 0, 42);
    hash_and_print("Identity::Address",                 &value);
    let value: (u8, u128, u128)                        = (0, u128::MAX, u128::MAX);
    hash_and_print("Identity::Address",                 &value);

    let value: (u8, u128, u128)                        = (1, 0, 0);
    hash_and_print("Identity::ContractId",                 &value);
    let value: (u8, u128, u128)                        = (1, 0, 1);
    hash_and_print("Identity::ContractId",                 &value);
    let value: (u8, u128, u128)                        = (1, 0, 42);
    hash_and_print("Identity::ContractId",                 &value);
    let value: (u8, u128, u128)                        = (1, u128::MAX, u128::MAX);
    hash_and_print("Identity::ContractId",                 &value);

    let value: (u128, u128, u128, u128)                        = (0, 0, 0, 0);
    hash_and_print("Ed25519",                 &value);
    let value: (u128, u128, u128, u128)                        = (0, 0, 0, 1);
    hash_and_print("Ed25519",                 &value);
    let value: (u128, u128, u128, u128)                        = (0, 0, 0, 42);
    hash_and_print("Ed25519",                 &value);
    let value: (u128, u128, u128, u128)                        = (u128::MAX, u128::MAX, u128::MAX, u128::MAX);
    hash_and_print("Ed25519",                 &value);

    let value: (u128, u128)                        = (u128::MAX >> 12*8, u128::MAX);
    hash_and_print("EvmAddress max",                 &value);
}
