library;

struct S<T> {
    x: T,
}

pub fn play() {
   let s: S<Option<u8>> = S { x: Option::Some(123) };
   match s.x {
       Some(x) => assert(x == 123u8),
       None => assert(false),
   };
}
