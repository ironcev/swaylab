script;

#[error_type]
enum SomeError {
    #[error(m = "An error has occurred.")]
    A: (),
}

fn main() {
    panic SomeError::A; // 472 Bytes.
    // panic "An error has occurred."; // 112 Bytes.
}
