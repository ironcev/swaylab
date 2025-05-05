script;

use std::crypto::public_key::*;
use std::crypto::secp256k1::*;
use std::crypto::secp256r1::*;
use std::crypto::signature::*;

use std::vm::evm::evm_address::EvmAddress;

// Bytecode size: 4528.
fn main() {
    let public_key = std::crypto::public_key::PublicKey::new();
    let message = std::crypto::message::Message::new();

    let secp256k1 = std::crypto::secp256k1::Secp256k1::new();
    let _ = secp256k1 == secp256k1;                                     // 4464.
    let _ = secp256k1.address(message);                                 // 4424.
    let _ = secp256k1.evm_address(message);                             // .
    let _ = secp256k1.verify(public_key, message);                      // .
    let _ = secp256k1.verify_address(Address::zero(), message);         // .
    let _ = secp256k1.verify_evm_address(EvmAddress::zero(), message);  // .
}
