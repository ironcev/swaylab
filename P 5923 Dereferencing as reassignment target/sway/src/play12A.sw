library;

#[inline(never)]
pub fn play() {
    let mut x = 123u8;
    copy_type_ref(&mut x);
}

#[inline(never)]
fn copy_type_ref(r_x: &mut u8) {
    *r_x = 111u8;
}