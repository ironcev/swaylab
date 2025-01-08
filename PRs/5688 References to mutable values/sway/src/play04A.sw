library;

const X = 123;

pub fn play() {
    let _ = &mut X;

    let _ = *&mut X + *&mut X;

    let _ = *&X + *&mut X;

    let _ = *&mut X + *&X;

    let x = *&X + *&mut X;
    let _ = x + x;
}
