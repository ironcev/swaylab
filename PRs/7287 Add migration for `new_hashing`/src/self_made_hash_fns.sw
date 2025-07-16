library;

fn sha256<T>(_t: T) {}
fn keccak256(x: u8, y: u8) {}

pub fn play() -> u64 {
    let _ = sha256(0u8);
    let _ = sha256("not affected");
    let _ = keccak256(0u8, 0u8);

    let _ = { keccak256(111u8, 111u8); 1 } + 1;
    let _ = { sha256("affected"); 1 } + 1;

    generic_fn("generic");

    42
}

fn generic_fn<T>(x: T) {
    let _ = sha256(x);
    let _ = { sha256(x); 1 } + 1;
}