library;

#[error_type]
pub enum AuthError {
    #[error(m = "The provided address is not an owner.")]
    NotAnOwner: b256,
    #[error(m = "The provided address is not an administrator.")]
    NotAnAdmin: b256,
}