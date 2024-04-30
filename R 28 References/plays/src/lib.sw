library;

pub struct Struct {
    pub b: bool,
    pub x: u32,
    pub y: u64,
}

impl core::ops::Eq for Struct {
    fn eq(self, other: Self) -> bool {
        self.b == other.b && self.x == other.x && self.y == other.y
    }
}

impl core::ops::Eq for &Struct {
    fn eq(self, other: Self) -> bool {
        self.b == other.b && self.x == other.x && self.y == other.y
    }
}