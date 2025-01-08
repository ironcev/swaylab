library;

pub fn play() {
    let v = 0u64;
    match v {
        1 => (),
        2 => (),
        1 | 2 => (),
        _ => (),
    };
}
