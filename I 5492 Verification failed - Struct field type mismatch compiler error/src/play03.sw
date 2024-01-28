library;

enum Option<T> {
  Some: T,
  None: (),
}

#[inline(never)]
pub fn play() -> Option<u8> {
  match Option::Some::<bool>(true) {
    Option::Some(_b) => Option::Some(17),
    Option::None => Option::None,
  }
}