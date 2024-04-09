trait TraitA<T> { }

struct S { }

impl TraitA<Self> for S { }

impl<T> TraitA<T> for S { }

impl<T> TraitA<T> for S where T: std::ops::Add { }


trait TraitB<T> {
    fn new() -> T;
}

impl TraitB<Self> for S {
    fn new() -> S {
        S { }
    }
}

trait A { }

trait B { }

trait TraitX<T> {
    fn fun_x(t: T);
    fn method_x(&self, t: T);
}

impl<T> TraitX<T> for S
    where T: A
{
    fn fun_x(t: T) {
        println!("fun_x for T:A");
    }
    
    fn method_x(&self, t: T) {
        println!("method_x for T:A");
    }
}

impl<T> TraitX<T> for S
    where T: B
{
    fn fun_x(t: T) {
        println!("fun_x for T:B");
    }
    
    fn method_x(&self, t: T) {
        println!("method_x for T:B");
    }
}

struct SA { }
struct SB { }

impl A for SA { }

impl B for SB { }


// error[E0119]: conflicting implementations of trait `TraitA<S>` for type `S`
//  --> src/lib.rs:7:1
//   |
// 5 | impl TraitA<Self> for S { }
//   | ----------------------- first implementation here
// 6 |
// 7 | impl<T> TraitA<T> for S { }
//   | ^^^^^^^^^^^^^^^^^^^^^^^ conflicting implementation for `S`
// 
// error[E0119]: conflicting implementations of trait `TraitX<_>` for type `S`
//   --> src/lib.rs:43:1
//    |
// 31 | / impl<T> TraitX<T> for S
// 32 | |     where T: A
//    | |______________- first implementation here
// ...
// 43 | / impl<T> TraitX<T> for S
// 44 | |     where T: B
//    | |______________^ conflicting implementation for `S`


// ------------------------------------------------------------------------


struct S {
    x: i32,
    y: i32,
}

const fn const_func(s: &mut S) {
    s.x += 1;
}

fn main() {
    let mut s = S { x: 0, y: 0 };
    
    const_func(&mut s);
}


// error[E0658]: mutable references are not allowed in constant functions
//  --> src/main.rs:6:21
//   |
// 6 | const fn const_func(s: &mut S) {
//   |                     ^
//   |
//   = note: see issue #57349 <https://github.com/rust-lang/rust/issues/57349> for more information
// 
// For more information about this error, try `rustc --explain E0658`.

