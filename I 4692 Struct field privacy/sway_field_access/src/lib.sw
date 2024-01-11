library;

pub struct LibStruct {
    pub x: u64,
    y: u64,
}

impl LibStruct {
    pub fn new() -> Self {
        Self { x: 0, y: 0 }
    }
}