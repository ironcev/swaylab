struct S {
    x: u8,
}

fn main() {
    let s = S { x: 0 };
    
    let array = [&s, &s];

    let r = &&&&&array;
    
    let x = r[0].x;
    
    print!("{x}");
}

