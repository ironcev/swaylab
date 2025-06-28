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

    const ASCII_LOWERCASE_A: u8 = 97;

    let value: [u8;1]                        = [ASCII_LOWERCASE_A];
    hash_and_print("str",                 &value);

    let value: [u8;2]                        = [ASCII_LOWERCASE_A; 2];
    hash_and_print("str",                 &value);

    let value: [u8;3]                        = [ASCII_LOWERCASE_A; 3];
    hash_and_print("str",                 &value);

    let value: [u8;4]                        = [ASCII_LOWERCASE_A; 4];
    hash_and_print("str",                 &value);

    let value: [u8;5]                        = [ASCII_LOWERCASE_A; 5];
    hash_and_print("str",                 &value);

    let value: [u8;6]                        = [ASCII_LOWERCASE_A; 6];
    hash_and_print("str",                 &value);

    let value: [u8;7]                        = [ASCII_LOWERCASE_A; 7];
    hash_and_print("str",                 &value);

    let value: [u8;8]                        = [ASCII_LOWERCASE_A; 8];
    hash_and_print("str",                 &value);

    let value: [u8;9]                        = [ASCII_LOWERCASE_A; 9];
    hash_and_print("str",                 &value);

    let value: [u8;10]                        = [ASCII_LOWERCASE_A; 10];
    hash_and_print("str",                 &value);

    println!("---------------- NEW HASHING ----------------");

    let value: &str                        = "";
    hash_and_print("str",                 &value);
    let value: &str                        = "test";
    hash_and_print("str",                 &value);
    let value: &str                        = "Fastest Modular Execution Layer!";
    hash_and_print("str",                 &value);

    let value: (u64, [u64;0])                        = (0, []);
    hash_and_print("[u64;0]",                 &value);
    let value: u64                        = 0;
    hash_and_print("[u64;0]",                 &value);
    let value: usize                        = 0;
    hash_and_print("[u64;0]",                 &value);

    let value: (u64, [u64;1])                        = (1, [0]);
    hash_and_print("[u64;1]",                 &value);
    let value: (u64, [u64;1])                        = (1, [1]);
    hash_and_print("[u64;1]",                 &value);

    let value: (u64, [u64;2])                        = (2, [0, 0]);
    hash_and_print("[u64;2]",                 &value);
    let value: (u64, [u64;2])                        = (2, [1, 1]);
    hash_and_print("[u64;2]",                 &value);

    let value: (u64, [u64;3])                        = (3, [0, 0, 0]);
    hash_and_print("[u64;3]",                 &value);
    let value: (u64, [u64;3])                        = (3, [1, 1, 1]);
    hash_and_print("[u64;3]",                 &value);

    let value: (u64, [u64;4])                        = (4, [0, 0, 0, 0]);
    hash_and_print("[u64;4]",                 &value);
    let value: (u64, [u64;4])                        = (4, [1, 1, 1, 1]);
    hash_and_print("[u64;4]",                 &value);

    let value: (u64, [u64;5])                        = (5, [0, 0, 0, 0, 0]);
    hash_and_print("[u64;5]",                 &value);
    let value: (u64, [u64;5])                        = (5, [1, 1, 1, 1, 1]);
    hash_and_print("[u64;5]",                 &value);

    let value: (u64, [u64;6])                        = (6, [0, 0, 0, 0, 0, 0]);
    hash_and_print("[u64;6]",                 &value);
    let value: (u64, [u64;6])                        = (6, [1, 1, 1, 1, 1, 1]);
    hash_and_print("[u64;6]",                 &value);

    let value: (u64, [u64;7])                        = (7, [0, 0, 0, 0, 0, 0, 0]);
    hash_and_print("[u64;7]",                 &value);
    let value: (u64, [u64;7])                        = (7, [1, 1, 1, 1, 1, 1, 1]);
    hash_and_print("[u64;7]",                 &value);

    let value: (u64, [u64;8])                        = (8, [0, 0, 0, 0, 0, 0, 0, 0]);
    hash_and_print("[u64;8]",                 &value);
    let value: (u64, [u64;8])                        = (8, [1, 1, 1, 1, 1, 1, 1, 1]);
    hash_and_print("[u64;8]",                 &value);

    let value: (u64, [u64;9])                        = (9, [0, 0, 0, 0, 0, 0, 0, 0, 0]);
    hash_and_print("[u64;9]",                 &value);
    let value: (u64, [u64;9])                        = (9, [1, 1, 1, 1, 1, 1, 1, 1, 1]);
    hash_and_print("[u64;9]",                 &value);

    let value: (u64, [u64;10])                        = (10, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
    hash_and_print("[u64;10]",                 &value);
    let value: (u64, [u64;10])                        = (10, [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]);
    hash_and_print("[u64;10]",                 &value);

    let value: (u64, [u8;0])                        = (0, []);
    hash_and_print("Bytes",                 &value);

    let value: (u64, [u8;1])                        = (1, [0]);
    hash_and_print("Bytes",                 &value);

    let value: (u64, [u8;1])                        = (1, [1]);
    hash_and_print("Bytes",                 &value);

    let value: (u64, [u8;10])                       = (10, [0; 10]);
    hash_and_print("Bytes",                 &value);

    let value: (u64, [u8;10])                       = (10, [1; 10]);
    hash_and_print("Bytes",                 &value);

    let value: (u64, (u64, u64, [u64;9]))                       = (1, (0, 9, [0; 9]));
    hash_and_print("Vec::<(u64, Vec<u64>)>",                 &value);

    let value: (u64, u128, u128)                        = (32, 0, 0);
    hash_and_print("Message",                 &value);
    let value: (u64, u128, u128)                        = (32, 0, 1);
    hash_and_print("Message",                 &value);
    let value: (u64, u128, u128)                        = (32, 0, 42);
    hash_and_print("Message",                 &value);
    let value: (u64, u128, u128)                        = (32, u128::MAX, u128::MAX);
    hash_and_print("Message",                 &value);

    let value: (u64, u128, u128, u128, u128)                        = (2, 0, 0, 0, 0);
    hash_and_print("b512",                 &value);
    let value: (u64, u128, u128, u128, u128)                        = (2, 0, 0, 0, 1);
    hash_and_print("b512",                 &value);
    let value: (u64, u128, u128, u128, u128)                        = (2, 0, 0, 0, 42);
    hash_and_print("b512",                 &value);
    let value: (u64, u128, u128, u128, u128)                        = (2, u128::MAX, u128::MAX, u128::MAX, u128::MAX);
    hash_and_print("b512",                 &value);

    let value: (u64, [u8;1])                        = (1, [ASCII_LOWERCASE_A]);
    hash_and_print("str",                 &value);

    let value: (u64, [u8;2])                        = (2, [ASCII_LOWERCASE_A; 2]);
    hash_and_print("str",                 &value);

    let value: (u64, [u8;3])                        = (3, [ASCII_LOWERCASE_A; 3]);
    hash_and_print("str",                 &value);

    let value: (u64, [u8;4])                        = (4, [ASCII_LOWERCASE_A; 4]);
    hash_and_print("str",                 &value);

    let value: (u64, [u8;5])                        = (5, [ASCII_LOWERCASE_A; 5]);
    hash_and_print("str",                 &value);

    let value: (u64, [u8;6])                        = (6, [ASCII_LOWERCASE_A; 6]);
    hash_and_print("str",                 &value);

    let value: (u64, [u8;7])                        = (7, [ASCII_LOWERCASE_A; 7]);
    hash_and_print("str",                 &value);

    let value: (u64, [u8;8])                        = (8, [ASCII_LOWERCASE_A; 8]);
    hash_and_print("str",                 &value);

    let value: (u64, [u8;9])                        = (9, [ASCII_LOWERCASE_A; 9]);
    hash_and_print("str",                 &value);

    let value: (u64, [u8;10])                        = (10, [ASCII_LOWERCASE_A; 10]);
    hash_and_print("str",                 &value);
}
