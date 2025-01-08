library;

enum A {
  X: u8,
  Y: bool,
}

enum B {
  X: u8,
  Y: bool,
}

#[inline(never)]
pub fn play() -> u64 {
  let _: A = B::X(123);
  
  0
}
