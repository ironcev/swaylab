library;

#[error_type]
pub enum EvenOddError {
    #[error(m = "`set_even` was called with value zero. The value must be a non-zero even number.")]
    SetEvenIsZero : (),
    #[error(m = "`set_odd` was called with value zero. The value must be a non-zero odd number.")]
    SetOddIsZero: (),
    #[error(m = "Value was not an odd number: {.0}")]
    NotOdd : u64,
    #[error(m = "Value was not an even number.")]
    NotEven : u64,
}