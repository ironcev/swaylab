script;

struct S {  x: u8, }

fn revert_me() -> ! {
  __revert(0)
}

fn main() -> bool {
  let s =  S { x: 0 };

  match Option::Some::<S>(s) {
    Some(_) => revert_me(),
    None => revert_me(),
  }

  true
}