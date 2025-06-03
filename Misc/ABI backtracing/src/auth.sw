library;

use ::errors::AuthError;
use ::revert::my_require;

pub fn only_owner() {
    my_require(false, AuthError::NotAnOwner(b256::zero()));
}

pub fn only_admin() {
    only_owner();
    my_require(false, AuthError::NotAnAdmin(b256::zero()));
}

pub fn check_access_rights() {
    only_admin();
}