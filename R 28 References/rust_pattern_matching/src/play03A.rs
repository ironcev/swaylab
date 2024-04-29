struct A {
    x: u64,
}

struct B<'a> {
    r_i_a: &'a A,
    r_m_a: &'a mut A,
}

enum E<'a > {
    A(&'a mut A),
    B(&'a B<'a>),
    T(&'a mut u64, &'a u64)
}

pub fn play() {
    let mut a = A { x: 0 };
    let e = E::A(&mut a);
    
    match e {
        E::A( A { x: 111 }) => {},
        E::A( &mut A { x: 111 }) => {},
        // E::A( &A { x: 111 }) => {}, // expected mutable reference `&mut A`
        E::A(a) => {
            a.x = 222;
        },
        E::B( B { r_i_a: A { x: 111 }, ..}) => {},
        E::T(x, 555) => {
            *x = 222;
        },
        E::T(_, &777) => {},
        _ => {}
    };
    
    // ------------------------------------
    
    // let mut a = A { x: 0 };
    // let e = E::A(&mut a);
    
    // match &e {
    //     E::A( A { x: 111 }) => {},
    //     E::A(a) => {
    //         // (*a).x = 222; // cannot assign to `a.x`, which is behind a `&` reference
    //         // (**a).x = 222;
    //         // a.x = 222;
    //         println!("{}", (*a).x);
    //     },
    //     E::A(mut a) => {
    //         // (*a).x = 222; // cannot assign to `a.x`, which is behind a `&` reference
    //         // (**a).x = 222;
    //         // a.x = 222;
    //         println!("{}", (*a).x);
    //     },
    //     E::B( B { r_i_a: A { x: 111 }, ..}) => {},
    //     E::T(x, 555) => {
    //         **x = 222;
    //     },
    //     _ => {}
    // };
    
    // let mut a = A { x: 0 };
    // let e = E::A(&mut a);
    // let r_e = &e;
    // let r_r_r_e = &&r_e;
    
    // match r_r_r_e {
    //     E::A( A { x: 111 }) => {},
    //     E::A(a) => {
    //         (*a).x = 222;
    //         (**a).x = 222;
    //         a.x = 222;
    //     },
    //     E::B( B { r_i_a: A { x: 111 }, ..}) => {},
    //     E::T(x, 555) => {
    //         **x = 222;
    //     },
    //     _ => {}
    // }
}
