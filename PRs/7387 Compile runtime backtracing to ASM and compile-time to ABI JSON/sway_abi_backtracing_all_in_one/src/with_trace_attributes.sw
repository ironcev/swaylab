library;

struct S { }

trait T {
    fn fourth(self);
}

impl T for S {
    #[trace(never)]
    fn fourth(self) {
        fifth();
    }
}

impl S {
    #[trace(never)]
    fn second(self) {
        Self::third();
    }

    #[trace(always)]
    fn third() {
        S {}.fourth();
    }
}

#[trace(always)]
pub fn first() {
    S {}.second();
}

#[trace(always)]
fn fifth() {
    panic "Fifth has been called.";
}