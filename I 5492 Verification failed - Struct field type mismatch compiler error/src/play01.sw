library;

#[inline(never)]
pub fn play() -> Option<u8> {
  match Some(true) {
    Option::Some(_b) => Option::Some(17),
    Option::None => Option::None,
  }
}