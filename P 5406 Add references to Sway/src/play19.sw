library;

#[inline(never)]
pub fn play() {
    let x = ();
    let r_x = &x;

    log(r_x);
}