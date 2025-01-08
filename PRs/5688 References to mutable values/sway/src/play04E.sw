library;

const X = 123;

pub fn play() {
    let _ = [&mut X];

    let _ = [*&mut X, *&mut X];

    let _ = [*&X, *&mut X];

    let _ = [*&mut X, *&X];

    let a = [*&X, *&mut X];
    let _ = a[0] + a[1];
}
