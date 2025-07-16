library;

use std::hash::*;

pub struct StructA {
    array: [u8; 0],
}

impl StructA {
    pub fn new() -> Self {
        Self { array: [] }
    }
}

impl Hash for StructA {
    fn hash(self, ref mut state: Hasher) { }
}

pub struct StructB {
    x: u8,
    txt: str,
}

impl StructB {
    pub fn new() -> Self {
        Self { x: 0, txt: "" }
    }
}

impl Hash for StructB {
    fn hash(self, ref mut state: Hasher) { }
}

pub struct StructC {
    x: u8,
    message: std::crypto::message::Message,
    vec: Vec<u8>,
}

impl StructC {
    pub fn new() -> Self {
        Self { x: 0, message: std::crypto::message::Message::new(), vec: Vec::new() }
    }
}

impl Hash for StructC {
    fn hash(self, ref mut state: Hasher) { }
}

pub struct StructARec {
    s: StructA,
}

impl StructARec {
    pub fn new() -> Self {
        Self { s: StructA::new() }
    }
}

impl Hash for StructARec {
    fn hash(self, ref mut state: Hasher) { }
}

pub struct StructBRec {
    x: u8,
    s: StructB,
}

impl StructBRec {
    pub fn new() -> Self {
        Self { x: 0, s: StructB::new() }
    }
}

impl Hash for StructBRec {
    fn hash(self, ref mut state: Hasher) { }
}

pub struct StructCRec {
    x: u8,
    message: std::crypto::message::Message,
    s: StructC,
}

impl StructCRec {
    pub fn new() -> Self {
        Self { x: 0, message: std::crypto::message::Message::new(), s: StructC::new() }
    }
}

impl Hash for StructCRec {
    fn hash(self, ref mut state: Hasher) { }
}

pub enum EnumA {
    A: [u8; 0],
}

impl EnumA {
    pub fn new() -> Self {
        Self::A([])
    }
}

impl Hash for EnumA {
    fn hash(self, ref mut state: Hasher) { }
}

pub enum EnumB {
    A: u8,
    B: str,
}

impl EnumB {
    pub fn new() -> Self {
        Self::A(0)
    }
}

impl Hash for EnumB {
    fn hash(self, ref mut state: Hasher) { }
}

pub enum EnumC {
    A: u8,
    B: std::crypto::message::Message,
    C: Vec<u8>,
}

impl EnumC {
    pub fn new() -> Self {
        Self::C(Vec::new())
    }
}

impl Hash for EnumC {
    fn hash(self, ref mut state: Hasher) { }
}

pub enum EnumARec {
    E: EnumA,
}

impl EnumARec {
    pub fn new() -> Self {
        Self::E(EnumA::new())
    }
}

impl Hash for EnumARec {
    fn hash(self, ref mut state: Hasher) { }
}

pub enum EnumBRec {
    A: u8,
    E: EnumB,
}

impl EnumBRec {
    pub fn new() -> Self {
        Self::E(EnumB::new())
    }
}

impl Hash for EnumBRec {
    fn hash(self, ref mut state: Hasher) { }
}

pub enum EnumCRec {
    A: u8,
    B: std::crypto::message::Message,
    E: EnumC,
}

impl EnumCRec {
    pub fn new() -> Self {
        Self::E(EnumC::new())
    }
}

impl Hash for EnumCRec {
    fn hash(self, ref mut state: Hasher) { }
}
