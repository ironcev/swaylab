library;

struct S {
  x: u8,
  y: u8,
}

fn revert_me() -> ! {
  __revert(0)
}

#[inline(never)]
pub fn play() -> bool {
  let s =  S { x: 0, y: 0 };

  match s {
    S { x: 0, .. } => revert_me(),
    _ => { },
  };

  true
}