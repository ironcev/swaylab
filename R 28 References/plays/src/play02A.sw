library;

pub fn play() -> u64 {
    let t = (true, 32u32, 64u64);
    
    if t.0 {
        t.1.as_u64() + t.2
    }
    else {
        t.1.as_u64() - t.2
    }
}