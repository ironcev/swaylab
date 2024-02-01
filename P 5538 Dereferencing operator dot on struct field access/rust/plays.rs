struct S {
    x: u8,
}

fn main() {
    let s = S { x: 0 };

    let r = &&&&&s;
    
    let x = r.x;
    
    print!("{x}");
}
