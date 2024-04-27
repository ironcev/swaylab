struct S {
    x: u8,
}

pub fn play() {
    let mut s = S { x: 0 };

    let r = &&&&s;

    // r.x = 1;

    let m_r = &mut &mut &mut &mut s;

    m_r.x = 1;
}

// error[E0594]: cannot assign to `r.x`, which is behind a `&` reference
//   --> src/play06A.rs:10:5
//    |
// 10 |     r.x = 1;
//    |     ^^^^^^^ cannot assign