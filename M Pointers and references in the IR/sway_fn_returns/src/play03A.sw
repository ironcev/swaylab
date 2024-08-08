library;

struct S {
    x: bool,
    y: u32,
    z: (u32, u32, u32)
}

impl S {
    pub fn new() -> Self {
        S {
            x: false,
            y: 0,
            z: (0, 0, 0),
        }
    }

    pub fn use_me(self) -> () {
        poke(self.x);
        // poke(self.y);
        // poke(self.z);
    }
} 


#[inline(never)]
pub fn play() -> S {
    S::new()
}

#[inline(never)]
fn poke<T>(_x: T) {}