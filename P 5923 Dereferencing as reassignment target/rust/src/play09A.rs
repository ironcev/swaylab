struct S {
    x: u8,
}

pub fn play() {
    let mut s = S { x: 1 };
    
    let r_s = &mut s;
    
    r_s.x = 2;
    
    (*r_s).x = 2;
    
    (r_s).x = 2;
}