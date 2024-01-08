use super::PrivateTopStruct;

pub mod bottom;

struct PrivateMiddleStruct {
    pub x: u64,
    y: u64,
}

impl PrivateMiddleStruct {
    fn new(s: PrivateTopStruct) -> Self {
        Self {
            x: s.x,
            y: s.y,
        }
    }

    fn use_me(&self) {
        poke(self.x);
        poke(self.y);
    }
}

pub(crate) fn use_private_middle_struct() {
    PrivateMiddleStruct::new(PrivateTopStruct { x: 0, y: 0 }).use_me();
    // PrivateMiddleStruct::new(PrivateTopStruct { }).use_me();
    //                          ^^^^^^^^^^^^^^^^ missing `x` and `y`
}

fn poke<T>(_x: T) { }