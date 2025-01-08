library;

struct S {
  x: u8,
  y: u8,
}

#[inline(never)]
pub fn play() -> S {
  let s =  S { x: 0, y: 0 };

  match s {
    S { x: a, ..} | S { y: a, .. } => s,
  }
}