library;

pub fn my_require<E>(condition: bool, err: E) where E: Error {
    if !condition {
        panic err;
    }
}