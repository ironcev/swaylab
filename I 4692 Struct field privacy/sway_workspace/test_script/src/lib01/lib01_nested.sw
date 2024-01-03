library;

//use ::lib01::Lib01PrivateStruct;

struct Lib01PrivateNestedStruct {
    pub x: u64,
    y: u64,
}

impl Lib01PrivateNestedStruct {
    //fn new(s: Lib01PrivateStruct) -> Self {
    fn new() -> Self {
        Self {
            x: 0,
            y: 0,
        }
    }

    fn use_me(self) {
        poke(self.x);
        poke(self.y);
    }
}

pub struct Lib01PublicNestedStruct {
    pub x: u64,
    y: u64,
}

impl Lib01PublicNestedStruct {
    //fn new(s: Lib01PrivateStruct) -> Self {
    fn new() -> Self {
        Self {
            x: 0,
            y: 0,
        }
    }

    fn use_me(self) {
        poke(self.x);
        poke(self.y);
    }
}

pub fn use_me() {
    let s = Lib01PrivateNestedStruct::new();
    s. use_me();

    let s = Lib01PublicNestedStruct::new();
    s. use_me();
}

fn poke<T>(_x: T) { }