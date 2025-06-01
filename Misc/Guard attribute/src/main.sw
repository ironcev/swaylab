script;

mod revert;

use revert::*;

#[error_type]
enum MyError {
    #[error(m = "Not an owner.")]
    NotOwner: u64,
    #[error(m = "Custom error.")]
    CustomError: str,
}

#[guard]
fn only_owner_with_require() {
    my_require(false, "Only owner can call this function (with require).");
    // require(false, "Only owner can call this function (with require).");
}

#[guard]
fn only_owner_with_panic() {
    if !false {
        panic "Only owner can call this function (with panic).";
    }
}

fn main() {
    log("Hello, world!");
}

fn call_failing_my_require() {
    my_require(false, "Called failing my_require.");
    // require(false, "Called failing my_require.");
}

fn call_only_owner_with_require() {
    only_owner_with_require();
}

#[test]
fn test_call_failing_my_require() {
    call_failing_my_require();
}

#[test]
fn test_call_only_owner_with_require() {
    call_only_owner_with_require();
}

#[test]
fn test_directly_call_only_owner_with_panic() {
    only_owner_with_panic();
    only_owner_with_panic();
    only_owner_with_panic();
}

#[test]
fn test_call_my_require_with_error_type_enum() {
    my_require(false, MyError::NotOwner(42));
    // require(false, MyError::NotOwner(42));
}

#[test]
fn test_regular_non_guard_panicking() {
    panic "Regular non-guard panicking.";
}