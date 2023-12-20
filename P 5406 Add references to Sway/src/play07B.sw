library;

#[inline(never)]
pub fn play() {
    array_of_same_u8();
    array_of_different_u8();
    array_of_different_u8_all_used();
    array_of_different_u8_all_used_array_not_optimized_away();
}

#[inline(never)]
pub fn array_of_same_u8() {
    let x = 123u8;

    let a = [&x, &x, &x];

    let a_r_0_addr = asm(r: a[0]) { r: raw_ptr };
    log(a_r_0_addr);
}

#[inline(never)]
pub fn array_of_different_u8() {
    let x = 123u8;
    let y = 111u8;
    let z = 222u8;

    let a = [&x, &y, &z];

    let a_r_0_addr = asm(r: a[0]) { r: raw_ptr };
    log(a_r_0_addr);
}

#[inline(never)]
pub fn array_of_different_u8_all_used() {
    let x = 123u8;
    let y = 111u8;
    let z = 222u8;

    let a = [&x, &y, &z];

    let a_r_0_addr = asm(r: a[0]) { r: raw_ptr };
    let a_r_1_addr = asm(r: a[1]) { r: raw_ptr };
    let a_r_2_addr = asm(r: a[2]) { r: raw_ptr };

    log(a_r_0_addr);
    log(a_r_1_addr);
    log(a_r_2_addr);
}

#[inline(never)]
pub fn array_of_different_u8_all_used_array_not_optimized_away() {
    let x = 123u8;
    let y = 111u8;
    let z = 222u8;

    let a = [&x, &y, &z];
    let _ = asm(r: a) { r: raw_ptr };

    let a_r_0_addr = asm(r: a[0]) { r: raw_ptr };
    let a_r_1_addr = asm(r: a[1]) { r: raw_ptr };
    let a_r_2_addr = asm(r: a[2]) { r: raw_ptr };

    log(a_r_0_addr);
    log(a_r_1_addr);
    log(a_r_2_addr);
}