library;

struct S {
    s: u8,
}

enum E<T> {
    Some: T,
}
    
fn play() {
    let x = 0u8;
    if let mut v = x {
    };

    let x = S { s: 0 };
    if let mut v = x {
    };

    let x = S { s: 0 };
    if let S { s: mut v } = s {
    };

    let x = (0u8, 0u8);
    if let (mut v, _) = x {
    };

    let x = E::Some(0u8);
    if let E::Some(mut v) = x {
    };

    let x = 0u8;
    if let ref v = x {
    };

    let x = 0u8;
    if let ref mut v = x {
    };
}
