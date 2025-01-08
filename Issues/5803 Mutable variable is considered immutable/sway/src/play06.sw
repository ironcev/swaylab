library;

pub fn play() {
    let array = [1u64, 2u64, 3u64];
    let _ = match array {
        _ => true,
    };

    let ptr = __addr_of(array);
    let _ = match ptr {
        _ => true,
    };
}
