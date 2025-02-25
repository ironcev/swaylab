/// This is a comment.
mod play01A;

// //! This is an inner comment.
// error[E0753]: expected outer doc comment
mod play02A;
//------------ the inner doc comment doesn't annotate this module

mod play03A;

mod play04A;

mod play05A;

mod play06A;

// #[inline(always)]
// error[E0518]: attribute should be applied to function or closure
// not a function or closure
enum E {
    A,
}

#[inline]

// #[inline(always, always)]
// error[E0534]: expected one argument

// #[inline(true)]
// error[E0535]: invalid argument
// valid inline arguments are `always` and `never`
fn fun_1() {}

/// Doc-comment line 1.
#[inline(always)]
/// Doc-comment line 2.
fn fun_2() {}

/// Comment line one.
#[allow(dead_code)]
/// Comment line two.
fn fun() { }

// #[allow(dead_code)]
/// Doc-comment.
use std::cmp::*;

/// Comment.
#[allow(dead_code)]
#[inline(always)]
fn main() {
    println!("Hello, world!");
    let _ = Ordering::Equal;
    fun_2();
}

#[test]
#[inline(always)]
fn test() {}

// #[allow(dead_code)]
// error: expected item after attributes

// /// Some comment.
// ^^^^^^^^^^^^^^^^^ this doc comment doesn't document anything
// error: expected item after doc comment