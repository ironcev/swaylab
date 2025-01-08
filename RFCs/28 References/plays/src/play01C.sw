library;

pub fn play() -> u64 {
    let u_32 = 32u32;
    let u_64: u64 = u_32.as_u64() + u_32.as_u64();

    by_val_mut(u_64)
}

#[inline(never)]
fn by_val_mut(mut value: u64) -> u64 {
    // ERROR: ^^^^^ This parameter was declared as mutable, which is not supported yet, did you mean to use ref mut?
    value + value
}