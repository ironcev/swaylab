pub fn play() {
    for i in 0..=4 {
        let mut x = i;

        match x {
            0 => {},
            // &1 => {}, // expected type `{integer}`
            a if i == 1 => println!("{a}"),
            mut a if i == 2 => {
                a = 22;
                println!("a: {a}");
                println!("x: {x}");
            },
            ref a if i == 3 => println!("{a}"),
            ref mut a if i == 4 => {
                *a = 44;
                // a = &mut 321; // cannot assign twice to immutable variable
                println!("a: {a}");
                println!("x: {x}");
            },
            _ => {},
        }
    }

    println!("// ----------------------");

    for i in 0..=5 {
        let x = i;

        match &x {
            0 if i == 0 => println!("0"),
            &1 if i == 1 => println!("1"),
            // &&2 => {}, // expected integer, found `&_`
            // &mut 3 => {}, // expected reference `&{integer}`
            a if i == 2 => println!("{a}"),
            mut a if i == 3 => {
                a = &33;
                println!("a: {a}");
                println!("x: {x}");
            },
            ref a if i == 4 => println!("{a}"),
            ref mut a if i == 5 => {
                *a = &55;
                println!("a: {a}");
                println!("x: {x}");
            },
            _ => {},
            // mut ref mut a => println!("{a}"), // the order of `mut` and `ref` is incorrect
        }
    }

    println!("// ----------------------");

    for i in 0..=5 {
        let mut x = i;

        match &mut x {
            0 if i == 0 => println!("0"),
            &mut 1 if i == 1 => println!("1"), // expected mutable reference `&mut {integer}`
            // &1 if i == 1 => println!("1"), // expected mutable reference `&mut {integer}`
            a if i == 2 => println!("{a}"),
            mut a if i == 3 => {
                let mut v = 33;
                a = &mut v;
                println!("a: {a}");
                println!("x: {x}");
            },
            ref a if i == 4 => println!("{a}"),
            ref mut a if i == 5 => {
                let mut v = 55;
                *a = &mut v;
                println!("a: {a}");
                println!("x: {x}");
            },
            _ => {},
        }
    }

    println!("// ----------------------");

    for i in 0..=5 {
        let x = i;

        match &&&x {
            0 if i == 0 => println!("0"),
            &&&1 if i == 1 => println!("1"),
            a if i == 2 => println!("{a}"),
            mut a if i == 3 => {
                a = &&& 33;
                println!("a: {a}");
                println!("x: {x}");
            },
            ref a if i == 4 => println!("{a}"),
            ref mut a if i == 5 => {
                *a = &&&& 55;
                println!("a: {a}");
                println!("x: {x}");
            },
            _ => {},
        }
    }
}