script;

// #[cfg(target = "fuel")]
// ^^^^^^^^^^^^^^^^^^^^^^^ Cannot annotate a module.
// /// Doc-comment.
// Cannot attach a documentation comment to a dependency.
mod play01A;

mod play02A;

mod play03A;

mod play04A;

mod play05A;

//! This is an inner doc comment.
mod play06A;

// /// This is a doc comment.
// ^^^^^^^^^^^^^^^^^^^^^^^^^^ Cannot attach a documentation comment to a dependency.
mod play07A;

mod play08A;

mod play09A;

/// Doc for MyOption.
type MyOption = std::option::Option::<u64>;

// #[cfg(target = "fuel")]
/// Doc-comment.
// ^^^^^^^^^^^^^^^^ Expected an item.
use play01A::*;

#[cfg(target = "fuel")]
#[cfg(target = "fuel")]
// #[doc("this is some document")]
//    ^^^^^^^^^^^^^^^^^^^^^^^ Expected an identifier.
// /// Doc-comment.
// #[doc(this is some document)]
//         ^^ Expected `,`.
#[doc(this,is,some,document)]
fn main() {
    play01A::play();
}

#[payable]
#[fallback]
struct Struct { }

// /// Doc-comment.
//              ^ Expected an item after doc comment.
