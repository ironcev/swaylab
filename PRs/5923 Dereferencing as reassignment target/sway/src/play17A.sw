library;

#[inline(never)]
pub fn play() {
   references(true, &mut 0, &mut 1);
}

#[inline(never)]
fn references(b: bool, ref_a: &mut u64, ref_b: &mut u64) {
    let x = 0;

    let ref_local = if b {
        ref_a
    } else {
        ref_b
    };

    *ref_local = 2;
}