//! This is a multiline module comment.
//! This is the second line.
script;

mod impl_eq;

fn main() {
    impl_eq::use_core_ops_eq::play();
    impl_eq::use_core_ops_star::play();
    impl_eq::full_path::play();
    // impl_eq::use_core_star::play();
}
