library;

enum Option<T> {
  Some: T,
  None: (),
}

#[inline(never)]
pub fn play() -> bool {
  match Option::Some::<bool>(true) {
    Option::Some(b) => b,
    Option::None => __revert(0),
  }
}