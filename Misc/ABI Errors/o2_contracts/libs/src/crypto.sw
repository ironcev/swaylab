library;

use std::{
    assert::assert,
    b512::B512,
    bytes::Bytes,
    crypto::{
        message::Message,
        public_key::PublicKey,
        secp256k1::*,
        signature::Signature,
    },
    hash::{
        keccak256,
        sha256,
    },
    string::String,
    tx::{
        tx_id,
        tx_witness_data,
    },
    vm::evm::{
        evm_address::EvmAddress,
    },
};

// Enums

/// Represents different types of addresses that can be used for signature verification.
/// Supports both Fuel native addresses and Ethereum-compatible addresses.
pub enum SignatureAddress {
    FUEL: Address,
    EVM: EvmAddress,
}

// Constants

/// Fuel message prefix.
/// This is used to create a message that can be signed by the Fuel address.
/// The prefix is `b"Fuel Signed Message:\n"`.
const FUEL_PREFIX: [u8; 22] = [
    25, 70, 117, 101, 108, 32, 83, 105, 103, 110, 101, 100, 32, 77, 101, 115, 115,
    97, 103, 101, 58, 10,
];

/// Ethereum message prefix.
/// This is used to create a message that can be signed by the Ethereum address.
/// The prefix is `b"Ethereum Signed Message:\n"`.
const ETHEREUM_PREFIX: [u8; 26] = [
    25, 69, 116, 104, 101, 114, 101, 117, 109, 32, 83, 105, 103, 110, 101, 100, 32,
    77, 101, 115, 115, 97, 103, 101, 58, 10,
];

/// Ethereum addresses are pad with 12 zeros as they are only
/// 20 bytes long, so we check if a address is EVM by checking the padding
const EVM_PREFIX: [u8; 12] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

/// Converts a u64 value to its ASCII string representation.
/// Used for creating message prefixes with length indicators.
///
/// # Arguments
///
/// * `value` - The number to convert
///
/// # Returns
///
/// * `Bytes` - ASCII bytes representing the number
pub fn u64_to_ascii(value: u64) -> Bytes {
    let mut value = value;
    let mut digits = [48u8; 64];
    let mut i = 63;
    while true {
        let digit = asm(v: value % 10) {
            v: u8
        };
        digits[i] = digit + 48; // ascii zero = 48
        value = value / 10;
        if value == 0 {
            break;
        }
        i -= 1;
    }

    Bytes::from(raw_slice::from_parts::<u8>(__addr_of(digits).add::<u8>(i), 64 - i))
}

/// Checks if an address is an Ethereum-compatible address.
/// EVM addresses have a specific 12-byte prefix pattern.
///
/// # Arguments
///
/// * `address` - The address to check
///
/// # Returns
///
/// * `bool` - True if the address is EVM-compatible, false otherwise
pub fn is_evm_address(address: Address) -> bool {
    asm(r1, r2: address.bits(), r3: EVM_PREFIX, r4: 12) {
        meq r1 r2 r3 r4;
        r1: bool
    }
}

/// Verifies a signature against an address for given arguments.
/// Supports both Fuel and Ethereum signature verification.
///
/// # Arguments
///
/// * `address` - The address that allegedly signed the data
/// * `signature` - The signature to verify
/// * `args` - The data that was signed (must be ABI encodable)
///
/// # Returns
///
/// * `bool` - True if the signature is valid for the given address and data
///
/// # Note
///
/// - For EVM addresses, uses Ethereum's message prefix and keccak256 hashing
/// - For Fuel addresses, uses Fuel's message prefix and sha256 hashing
pub fn verify_address<T>(
    address: Address,
    signature: Signature,
    args: T,
) -> bool
where
    T: AbiEncode,
{
    let args_bytes = encode(args);
    let size_bytes = u64_to_ascii(args_bytes.number_of_bytes());

    if is_evm_address(address) {
        // Ethereum address verification
        let mut payload_bytes = Bytes::new();
        payload_bytes.append_raw_slice(raw_slice::from_parts::<u8>(__addr_of(ETHEREUM_PREFIX), 26));
        payload_bytes.append(size_bytes);
        payload_bytes.append_raw_slice(args_bytes);
        let recovered_address = signature.evm_address(Message::from(keccak256(payload_bytes)));

        if let Ok(recovered_address) = recovered_address {
            let addr: b256 = recovered_address.into();
            return Address::from(addr) == address;
        }
    } else {
        // Fuel address verification
        let mut payload_bytes = Bytes::new();
        payload_bytes.append_raw_slice(raw_slice::from_parts::<u8>(__addr_of(FUEL_PREFIX), 22));
        payload_bytes.append(size_bytes);
        payload_bytes.append_raw_slice(args_bytes);
        let recovered_address = signature.address(Message::from(sha256(payload_bytes)));

        if let Ok(recovered_address) = recovered_address {
            return recovered_address == address;
        }
    }

    return false;
}
