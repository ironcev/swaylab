library;

struct S {
    x: u8,
}

#[inline(never)]
pub fn play() {
    reference_part_of_aggregates();
    reference_asm_block_result();
}

#[inline(never)]
pub fn reference_part_of_aggregates() {
    let s = S { x: 123 };
   
    let r_s_x_1 = &s.x;
    let r_s_x_2 = &s.x;

    log(r_s_x_1);
    log(r_s_x_2);
}

#[inline(never)]
pub fn reference_asm_block_result() {
    let s = S { x: 123 };
   
    let r_s_x_1 = &asm(r: &s) { r: S }.x;
    let r_s_x_2 = &asm(r: &s) { r: S }.x;

    log(r_s_x_1);
    log(r_s_x_2);
}
