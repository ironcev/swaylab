library;

#[inline(never)]
pub fn play() -> Option<u8> {
    let o = bar(true);
    match o {
      Some(x) => x == 19,
      None => false,
    };

    let o = bar(false);
    match o {
      Some(x) => false,
      None => true,
    };

    o
}

fn bar(b: bool) -> Option<u8> {
   if(b) {
     Option::Some(19)
   } else {
     Option::None
   }
}