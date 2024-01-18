library;

//use ::lib02::Lib01PrivateStruct;

struct Lib02PrivateNestedStruct {
    x: u64,
    y: u64,
}

impl Lib02PrivateNestedStruct {
    //fn new(s: Lib02PrivateStruct) -> Self {
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

pub struct Lib02PublicNestedStruct {
    x: u64,
    y: u64,
}

impl Lib02PublicNestedStruct {
    //fn new(s: Lib02PrivateStruct) -> Self {
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
    let s = Lib02PrivateNestedStruct::new();
    s. use_me();

    let s = Lib02PublicNestedStruct::new();
    s. use_me();
}

fn poke<T>(_x: T) { }