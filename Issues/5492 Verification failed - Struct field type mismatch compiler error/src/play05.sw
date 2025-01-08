library;

struct S {
  x: u8,
  y: u8,
}

#[inline(never)]
pub fn play() -> bool {
  let s =  S { x: 0, y: 0 };

  let _ = match s {
    S { x: 0, .. } => 0,
    S { .. } => 0u8,
    _ => 0u8,
  };

  true
}