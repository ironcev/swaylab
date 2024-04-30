trait Trait {
    fn m(&self);
}

impl<T> Trait for T {
    fn m(&self) {
        println!("Trait for T");
    }
}

impl<T> Trait for &T {
    fn m(&self) {
        println!("Trait for &T");
    }
}

// error[E0119]: conflicting implementations of trait `Trait` for type `&_`
//   --> src/main.rs:11:1
//   |
// 5  | impl<T> Trait for T {
//   | ------------------- first implementation here
// ...
// 11 | impl<T> Trait for &T {
//   | ^^^^^^^^^^^^^^^^^^^^ conflicting implementation for `&_`

// impl<T> Trait for &&T {
//     fn m(&self) {
//         println!("Trait for &&T");
//     }
// }

// error[E0119]: conflicting implementations of trait `Trait` for type `&&_`
//   --> src/main.rs:11:1
//   |
// 5  | impl<T> Trait for &T {
//   | -------------------- first implementation here
// ...
// 11 | impl<T> Trait for &&T {
//   | ^^^^^^^^^^^^^^^^^^^^^ conflicting implementation for `&&_`

fn main() {
    let r = &0u64;
    
    r.m();
}
