script;

impl u64 {
    #[inline(never)]
    fn by_val(self) -> Self {
        self + self
    }

    #[inline(never)]
    fn by_ref_mut(ref mut self) -> Self {
        self += self;
        self
    }
}

#[inline(never)]
fn main() {
    let mut x = 112233u64;
    x.by_val();
    x.by_ref_mut();
}

