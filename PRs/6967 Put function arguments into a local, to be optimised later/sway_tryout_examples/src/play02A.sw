library;

#[inline(never)]
pub fn play() {
    let t = (0, 0);

    let t = asm(r: t) {
        r: &(u64, u64)
    };
}