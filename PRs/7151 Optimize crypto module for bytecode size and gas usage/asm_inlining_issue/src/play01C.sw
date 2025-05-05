library;

use std::crypto::message::Message;
use std::crypto::signature::*;
use std::crypto::public_key::PublicKey;
use std::hash::sha256;

enum SignatureError {
    InvalidSignature: (),
}

pub struct Secp256k1 {
    bits: [u8; 64],
}

impl Secp256k1 {
    pub fn new() -> Self {
        Self {
            bits: [0u8; 64],
        }
    }

    pub fn recover(self, message: Message) -> Result<PublicKey, SignatureError> {
        Ok(PublicKey::from(message.try_into().unwrap()))
    }

    pub fn address(self, message: Message) -> Result<Address, SignatureError> {
        match self.recover(message) {
            Ok(pub_key) => Ok(Address::from(sha256(pub_key))),
            Err(e) => Err(e),
        }
    }
}

impl PartialEq for Secp256k1 {
    // #[inline(always)]
    #[inline(never)]
    fn eq(self, other: Self) -> bool {
        asm(result, r2: self.bits, r3: other.bits, r4: 64) {
            meq result r2 r3 r4;
            result: bool
        }
    }
}

pub fn play() {
    let message = Message::new();
    let secp256k1 = Secp256k1::new();
    let _ = secp256k1 == secp256k1;
    let _ = secp256k1.address(message);
}

// With inlined assembly:    4944.
// Without inlined assembly: 6808.
