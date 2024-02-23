library;

#[inline(never)]
pub fn play() -> u64 {
  let r: &Option<u8> = &Option::Some(1);
  // Internal compiler error: Verification failed: Struct field type mismatch.
  
  0
}
