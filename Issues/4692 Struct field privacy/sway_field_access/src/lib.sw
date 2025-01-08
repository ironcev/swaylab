library;

pub struct LibStruct {
    pub x: u64,
    y: u64,
}

impl LibStruct {
    pub fn new() -> Self {
        Self { x: 0, y: 0 }
    }

    pub fn default() -> Self {
        Self { x: 0, y: 0 }
    }
}

pub struct FourFieldsStruct {
    pub x: u64,
    pub y: u64,
    pub z: u64,
    pub zz: u64,
}

pub struct ManyFieldsStruct {
    pub x: u64,
    pub y: u64,
    pub z: u64,
    pub zz: u64,
    pub zzz: u64,
    pub zzzz: u64,
}