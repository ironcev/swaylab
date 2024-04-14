library;

struct S {
    s: u8,
}

enum E<T> {
    Some: T,
}
    
fn play() {
    let x = 0u8;
    let _ = match x {
        mut v => {
            v
        },
    };

    let x = S { s: 0 };
    let _ = match x {
        mut v => {
            v
        },
    };

    let x = S { s: 0 };
    let _ = match x {
        S { s: mut v } => {
            v
        },
    };

    let x = (0u8, 0u8);
    let _ = match x {
        (mut v, _) => {
            v
        },
    };

    let x = E::Some(0u8);
    let _ = match x {
        E::Some(mut v) => {
            v
        },
    };

    let x = 0u8;
    let _ = match x {
        ref v => {
            v
        },
    };

    let x = 0u8;
    let _ = match x {
        ref mut v => {
            v
        },
    };
}
