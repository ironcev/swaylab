use super::{PrivateTopStruct, PrivateMiddleStruct, TOP_CONST};

struct PrivateBottomStruct {
    pub x: u64,
    y: u64,
}

impl PrivateBottomStruct {
    fn new(s: PrivateTopStruct, m: PrivateMiddleStruct) -> Self {
        Self {
            x: s.x,
            y: m.y,
        }
    }

    fn use_me(&self) {
        poke(self.x);
        poke(self.y);
    }
}

pub(crate) fn use_private_bottom_struct() {
    PrivateBottomStruct::new(PrivateTopStruct { x: 0, y: 0 }, PrivateMiddleStruct { x: 0, y: 0 }).use_me();

    let _ = TOP_CONST;
}

fn poke<T>(_x: T) { }