library;

pub struct Rect {
    width: u64,
    height: u64,
}

impl Rect {
    /// Creates a new rectangle with specified `width` and `height`.
    pub fn new(width: u64, height: u64) -> Self {
        Self {
            width,
	        height,
        }
    }

    /// Rectangle's width.
    pub fn width(self) -> u64 {
        self.width
    }

    /// Rectangle's height.
    pub fn height(self) -> u64 {
        self.height
    }

    /// Rectangle's area.
    pub fn area(self) -> u64 {
        self.width * self.height
    }
}
