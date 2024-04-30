struct S { }

trait Trait {
    fn m(&self);
}

impl Trait for S {
    fn m(&self) {
        println!("Trait for S");
    }
}

impl Trait for &S {
    fn m(&self) {
        println!("Trait for &S");
    }
}

impl Trait for &mut S {
    fn m(&self) {
        println!("Trait for &mut S");
    }
}

impl Trait for &&S {
    fn m(&self) {
        println!("Trait for &&S");
    }
}

impl Trait for &mut &mut S {
    fn m(&self) {
        println!("Trait for &mut &mut S");
    }
}

impl Trait for & &mut S {
    fn m(&self) {
        println!("Trait for & &mut S");
    }
}

fn main() {
    let mut s = S { };
    
    s.m();
    (&s).m();
    (&mut s).m();
    (&&s).m();
    (&mut &mut s).m();
    (& &mut s).m();
    (&mut &s).m();
}

// Trait for S
// Trait for S
// Trait for &mut S
// Trait for &S
// Trait for &mut &mut S
// Trait for &mut S
// Trait for S
