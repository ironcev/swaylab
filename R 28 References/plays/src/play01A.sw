library;

pub fn play() -> u64 {
    let u_32 = 32u32;
    let u_64: u64 = u_32.as_u64() + u_32.as_u64();

    u_64
}