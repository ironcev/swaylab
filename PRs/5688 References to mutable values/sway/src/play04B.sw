library;

const X = 123;

pub fn play() {
    let x = *&X + *&mut X;
    let _ = x + x;
}
