library;

pub struct S {
    pub x: u8,
}

impl S {
    #[inline(never)]
    pub fn return_my_copy(self) -> Self {
        self
    }
}

#[inline(never)]
pub fn play() -> S {
    let s = S { x: 222 };
    s
}
