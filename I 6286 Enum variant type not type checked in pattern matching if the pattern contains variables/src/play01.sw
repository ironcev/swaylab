library;

enum E {
    A: (u8, u8, u8),
}

pub fn play() {
    let e = E::A((0, 0, 0));
    let _ = match e {
        E::A(_) => {},
        E::A(_, _) => {},
        E::A(_, _, _) => {},
        E::A(_, _, _, _) => {},
        E::A(x) => {},
        E::A(x, x) => {},
        E::A(x, x, x) => {},
        E::A(x, x, x, x) => {},
    };
}
