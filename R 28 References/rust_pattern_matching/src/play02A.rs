struct S {
    x: u64,
}

pub fn play() {
    for i in 0..=4 {
        let mut s = S { x: i };

        match s {
            S { x: 0 } if i == 0 => println!("{}", s.x),
            // &S { x: 0 } if i == 0 => println!("{}", s.x), // Expected S.
            // S { x: &0 } if i == 0 => println!("{}", s.x), // Expected u64.
            a if i == 1 => println!("{}", a.x),
            mut a if i == 2 => {
                a = S { x: 22 };
                println!("a: {}", a.x);
                // println!("s: {}", s.x); // Move is done in the match.
            },
            ref a if i == 3 => println!("{}", a.x),
            ref mut a if i == 4 => {
                *a = S { x: 44 };
                // a = &mut 321; // cannot assign twice to immutable variable
                println!("a: {}", a.x);
                println!("s: {}", s.x);
            },
            _ => {},
        }
    }

    println!("// ----------------------");

    for i in 0..=4 {
        let s = S { x: i };

        match &s {
            S { x: 0 } if i == 0 => println!("{}", s.x),
            &S { x: 0 } if i == 0 => println!("{}", s.x),
            a if i == 1 => println!("{}", a.x),
            mut a if i == 2 => {
                a = &S { x: 22 };
                println!("a: {}", a.x);
                println!("s: {}", s.x);
            },
            ref a if i == 3 => println!("{}", a.x),
            ref mut a if i == 4 => {
                *a = &S { x: 44 };
                println!("a: {}", a.x);
                println!("s: {}", s.x);
            },
            _ => {},
        }
    }

    println!("// ----------------------");

    for i in 0..=4 {
        let mut s = S { x: i };

        match &mut s {
            S { x: 0 } if i == 0 => println!("{}", s.x),
            a if i == 1 => println!("{}", a.x),
            mut a if i == 2 => {
                let mut v = S { x: 22 };
                a = &mut v;
                println!("a: {}", a.x);
                println!("s: {}", s.x);
            },
            ref a if i == 3 => println!("{}", a.x),
            ref mut a if i == 4 => {
                let mut v = S { x: 44 };
                *a = &mut v;
                println!("a: {}", a.x);
                println!("s: {}", s.x);
            },
            _ => {},
        }
    }

    println!("// ----------------------");


    for i in 0..=4 {
        let s = S { x: i };

        match &&&s {
            S { x: 0 } if i == 0 => println!("{}", s.x),
            a if i == 1 => println!("{}", a.x),
            mut a if i == 2 => {
                a = &&&S { x: 22 };
                println!("a: {}", a.x);
                println!("s: {}", s.x);
            },
            ref a if i == 3 => println!("{}", a.x),
            ref mut a if i == 4 => {
                *a = &&&S { x: 44 };
                println!("a: {}", a.x);
                println!("s: {}", s.x);
            },
            _ => {},
        }
    }
}