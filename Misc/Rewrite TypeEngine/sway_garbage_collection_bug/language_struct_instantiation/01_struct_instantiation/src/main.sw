script;

pub struct Struct<T> {
  pub x: T,
}

fn foo(b: bool) -> Struct<u8> {
  match Some(b) {
    Option::Some(true) => Struct { x: 17 },
    Option::Some(false) => Struct { x: 71 },
    Option::None => Struct { x: 71 },
  }
}

fn main() -> u64 {
    42
}
