trait MyIterator {
    type Item;
    fn next(&mut self) -> Option<Self::Item>;
}

struct S {}

impl MyIterator for S {
    type Item = ();

    fn next(&mut self) -> Option<Self::Item> {
        None
    }
}

// impl Iterator for S {
//     type Item = ();

//     fn next(&mut self) -> Option<Self::Item> {
//         None
//     }
// }

fn main() {
    for _x in (S {}) {}
}

// error[E0277]: `S` is not an iterator
//   --> src/main.rs:25:15
//    |
// 25 |     for _x in (S {}) {}
//    |               ^^^^^^ `S` is not an iterator
//    |
//    = help: the trait `Iterator` is not implemented for `S`
//    = note: required for `S` to implement `IntoIterator`