script;
 
struct S{
  a: u64,
  b: &mut u64,
}
 
fn foo() -> S{
  let a = 42;
  let mut b = 17;
  let s : S = S{a, b: &mut b};
  s
}
 
fn bar(s: S){
  let a = 42;
  let mut b = 18;
  let mut c = 19;
}
 
fn main() {
  let s:S = foo();
  bar(s);
  poke(*s.b);
}

#[inline(never)]
fn poke<T>(_x: T) { }