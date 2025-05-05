script;

use std::crypto::ed25519::*;
use std::crypto::point2d::*;
use std::crypto::public_key::*;
use std::crypto::scalar::*;
use std::crypto::secp256k1::*;
use std::crypto::secp256r1::*;
use std::crypto::signature::*;

use std::vm::evm::evm_address::EvmAddress;

// Bytecode size: 46104.
fn main() {
    let ed25519 = std::crypto::ed25519::Ed25519::new();
    let _ = ed25519 == ed25519;                                 // 44296.

    let point2d = std::crypto::point2d::Point2D::new();
    let _ = point2d == point2d;                                 // 44040.

    let public_key = std::crypto::public_key::PublicKey::new();
    let _ = public_key == public_key;                           // 43752.

    let _ = public_key.is_zero();                               // 43664.

    let scalar = std::crypto::scalar::Scalar::new();
    let _ = scalar == scalar;                                   // 43072.

    let message = std::crypto::message::Message::new();

    let secp256k1 = std::crypto::secp256k1::Secp256k1::new();
    let _ = secp256k1 == secp256k1;                             // 34112.
    let _ = secp256k1.address(message);                         // 34072.
    let _ = secp256k1.evm_address(message);                     // 34024.
    let _ = secp256k1.verify(public_key, message);              // 33936.
    let _ = secp256k1.verify_address(Address::zero(), message);         // 33920.
    let _ = secp256k1.verify_evm_address(EvmAddress::zero(), message);  // 33896.

    let secp256r1 = std::crypto::secp256r1::Secp256r1::new();
    let _ = secp256r1 == secp256r1;                             // 44592. <<-- ?? What is happening here ??
    // Before the optimization:
    // Time elapsed to parse the program to a concrete syntax tree (CST): 245.391µs
    // Time elapsed to parse the concrete syntax tree (CST) to a typed AST: 33.355377ms
    // Time elapsed to compile to ast: 33.809475ms
    // Time elapsed to compile ast to asm: 1.473308499s
    // Time elapsed to generate JSON ABI program: 20.174µs
    // Time elapsed to compile asm to bytecode: 1.134555ms

    // After the optimization:
    // Time elapsed to parse the program to a concrete syntax tree (CST): 268.224µs
    // Time elapsed to parse the concrete syntax tree (CST) to a typed AST: 32.706132ms
    // Time elapsed to compile to ast: 33.178467ms
    // Time elapsed to compile ast to asm: 3.039182804s
    // Time elapsed to generate JSON ABI program: 19.428µs
    // Time elapsed to compile asm to bytecode: 688.626µs 
    let _ = secp256r1.address(message);                         // 44544. 
    let _ = secp256r1.evm_address(message);                     // 44392.
    let _ = secp256r1.verify(public_key, message);              // 44400.
    let _ = secp256r1.verify_address(Address::zero(), message);         // 44296.
    let _ = secp256r1.verify_evm_address(EvmAddress::zero(), message);  // 44288.
}
