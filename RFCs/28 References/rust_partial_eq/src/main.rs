struct S {
    x: u64,
}

impl std::cmp::PartialEq for S {
    fn eq(&self, other: &Self) -> bool {
        println!("Eq for S");
        panic!("Eq for S");
        self.x == other.x
    }
}

// impl std::cmp::PartialEq for &S {
//     fn eq(&self, other: &Self) -> bool {
//         println!("Eq for &S");
//         self.x == other.x
//     }
// }

// error[E0119]: conflicting implementations of trait `PartialEq<&S>` for type `&S`
//   --> src/main.rs:12:1
//   |
// 12 | impl std::cmp::PartialEq for &S {
//   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//   |
//   = note: conflicting implementation in crate `core`:
//           - impl<A, B> PartialEq<&B> for &A
//              where A: PartialEq<B>, A: ?Sized, B: ?Sized;


// impl std::cmp::PartialEq for &&S {
//     fn eq(&self, other: &Self) -> bool {
//         println!("Eq for &S");
//         self.x == other.x
//     }
// }

// error[E0119]: conflicting implementations of trait `PartialEq<&&S>` for type `&&S`
//   --> src/main.rs:29:1
//   |
// 29 | impl std::cmp::PartialEq for &&S {
//   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//   |
//   = note: conflicting implementation in crate `core`:
//           - impl<A, B> PartialEq<&B> for &A
//              where A: PartialEq<B>, A: ?Sized, B: ?Sized;

fn main() {
    let s1 = S { x: 0 };
    let s2 = S { x: 0 };
    
    // println!("s1 == s2: {}", s1 == s2);
    // println!("&s1 == &s2: {}", &s1 == &s2);
    println!("&&s1 == &&s2: {}", &&s1 == &&s2);
}

//   1: core::panicking::panic_fmt
//              at /rustc/a8a1d3a771850e1e364eb9010e98789ce758a817/library/core/src/panicking.rs:72:14
//   2: <playground::S as core::cmp::PartialEq>::eq
//              at ./src/main.rs:8:9
//   3: core::cmp::impls::<impl core::cmp::PartialEq<&B> for &A>::eq
//              at /rustc/a8a1d3a771850e1e364eb9010e98789ce758a817/library/core/src/cmp.rs:1680:13
//   4: core::cmp::impls::<impl core::cmp::PartialEq<&B> for &A>::eq
//              at /rustc/a8a1d3a771850e1e364eb9010e98789ce758a817/library/core/src/cmp.rs:1680:13
//   5: playground::main
//              at ./src/main.rs:54:34
