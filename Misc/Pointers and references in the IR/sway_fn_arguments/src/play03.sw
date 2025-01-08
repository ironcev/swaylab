library;

#[inline(never)]
pub fn play() {
    let mut i = 100;
    inc_i(i);
}

fn inc_i(ref mut i: u64) {
    i = i + 11;
}