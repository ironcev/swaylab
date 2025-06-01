library;

#[guard]
pub fn my_require<E>(condition: bool, err: E) where E: Error {
    if !condition {
        panic err;
    }
    // panic error if !condition;
    // panic "This is a long error message. Here is some additional explanation." if !condition;
}