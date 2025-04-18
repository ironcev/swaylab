library;

pub fn play() {
    some_other_fn((1, 2));
    some_fn((1, 2));
}

#[inline(never)]
fn some_fn(tuple: (u64, u64)) {
    some_other_fn(tuple);
}

#[inline(never)]
fn some_other_fn(tuple: (u64, u64)) {
}