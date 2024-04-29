struct S {
    x: u8,
}

pub fn play() {
    let mut s1 = S { x: 1 };
    let mut s2 = S { x: 1 };
    
    (if s1.x > s2.x { s1 } else { s2 }).x = 2; // Moves s1 and s2.

    S { x: 1 }.x = 2;
}