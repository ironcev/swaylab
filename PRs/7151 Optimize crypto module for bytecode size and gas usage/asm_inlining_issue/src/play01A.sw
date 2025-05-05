library;

use std::crypto::message::Message;
use std::crypto::signature::*;
use std::crypto::public_key::PublicKey;
use std::hash::sha256;

pub struct Secp256k1 {
    bits: [u8; 64],
}

impl Secp256k1 {
    pub fn new() -> Self {
        Self {
            bits: [0u8; 64],
        }
    }

    pub fn address(self, message: Message) -> Result<Address, ()> {
        Ok(Address::from(message.try_into().unwrap()))
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

// With inlined assembly:    3808.
// Without inlined assembly: 5672.
