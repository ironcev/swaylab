library;

struct S { }

trait T {
    fn fourth(self);
}

impl T for S {
    fn fourth(self) {
        fifth();
    }
}

impl S {
    fn second(self) {
        Self::third();
    }

    fn third() {
        S {}.fourth();
    }
}

pub fn first() {
    S {}.second();
}

fn fifth() {
    panic "Fifth has been called.";
}