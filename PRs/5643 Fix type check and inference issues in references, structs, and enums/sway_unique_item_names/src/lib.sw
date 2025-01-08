library;

pub struct PubStruct {
    pub x: u8,
}

pub struct PubStruct { // Second definition.
    pub x: u8,
    pub y: u8,
}

pub struct PubStruct { // The last one wins.
    pub x: u8,
    pub y: u8,
    pub z: u8,
}