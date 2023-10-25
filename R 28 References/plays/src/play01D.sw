library;

pub fn play() -> u64 {
    let u_32 = 32u32;
    let mut u_64: u64 = u_32.as_u64() + u_32.as_u64();

    by_ref(u_64)
}

#[inline(never)]
fn by_ref(ref value: u64) -> u64 {
// error: Internal compiler error: Verification failed: Type mismatch found for call to 'by_ref_3': u64 is not a ptr u64.
// Please file an issue on the repository and include the code that triggered this error
    value + value
}