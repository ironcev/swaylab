script;

pub mod errors;
pub mod revert;
pub mod auth;

use revert::*;
use errors::*;
use auth::*;

fn only_owner_with_require() {
    my_require(false, "Only owner can call this function (with require).");
}

fn only_owner_with_panic() {
    if !false {
        panic "Only owner can call this function (with panic).";
    }
}

fn main() {
    check_access_rights();
}

fn call_failing_my_require() {
    my_require(false, "Called failing my_require.");
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
    my_require(false, AuthError::NotAnOwner(b256::zero()));
}

#[test]
fn test_regular_non_guard_panicking() {
    panic "Regular non-guard panicking.";
}

#[test]
fn test_main() {
    main();
}