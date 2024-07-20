library;

enum E {
    A: (u8, u8, u8),
}

pub fn play() {
    let e = E::A((0, 0, 0));
    let _ = match e {
        E::A(x, 0) => {},
        E::A(x, 0, 0) => {},
    };
}
