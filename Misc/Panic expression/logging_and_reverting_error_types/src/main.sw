script;

#[error_type]
enum MyError {
    #[error(m = "Error A.")]
    A: u8,
}

fn main() {
    log(MyError::A(1));
    log(MyError::A(2));
    panic MyError::A(3);
}

#[test]
fn test() {
    main();
}