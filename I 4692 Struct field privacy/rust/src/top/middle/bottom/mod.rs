use super::{PrivateTopStruct, PrivateMiddleStruct};
// PrivateTopStruct is available here because it is used in the `super`, means module `middle`.

// use play::top::PublicTopStruct as PublicTopStructPlayTop;
// ERROR: ^^^^ use of undeclared crate or module `play`

// use ::top::PublicTopStruct as PublicTopStructRootTop;
// error[E0432]: unresolved import `top`
//  --> src/top/middle/bottom/mod.rs:6:7
//   |
// 6 | use ::top::PublicTopStruct as PublicTopStructRootTop;
//   |       ^^^ help: a similar path exists: `crate::top`
//   |
//   = note: `use` statements changed in Rust 2018; read more at <https://doc.rust-lang.org/edition-guide/rust-2018/module-system/path-clarity.html>

use crate::top::PrivateTopStruct as PrivateTopStructCrateTop;

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
}

fn poke<T>(_x: T) { }