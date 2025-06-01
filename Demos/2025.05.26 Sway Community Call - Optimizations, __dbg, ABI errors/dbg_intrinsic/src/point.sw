library;

pub struct Point {
    pub x: u64,
    pub y: u64,
}

impl Debug for Point {
    fn fmt(self, ref mut f: Formatter) {
        f.debug_tuple("")
            .field(self.x)
            .field(self.y)
            .finish();
    }
}