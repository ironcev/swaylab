library;

const X = 123;

pub fn play() {
    let x = *&X + *&X;
    let _ = x + x;
}
