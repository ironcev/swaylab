library;

const C1 = 66;

#[inline(never)]
pub fn play() -> u64 {
    const C2 = C1;
    C2
}