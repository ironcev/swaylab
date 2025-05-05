script;

use std::crypto::ed25519::*;
use std::crypto::point2d::*;
use std::crypto::public_key::*;
use std::crypto::scalar::*;

use std::vm::evm::evm_address::EvmAddress;

// Bytecode size: 5728.
fn main() {
    let ed25519 = std::crypto::ed25519::Ed25519::new();
    let _ = ed25519 == ed25519;                                 // 5664.

    let scalar = std::crypto::scalar::Scalar::new();
    let _ = scalar == scalar;                                   // 5448.

    let point2d = std::crypto::point2d::Point2D::new();
    let _ = point2d == point2d;                                 // 5144.

    let public_key = std::crypto::public_key::PublicKey::new();
    let _ = public_key == public_key;                           // 4440.

    let _ = public_key.is_zero();                               // 4312.
}
