library;

//use ::lib01::PrivateLib01Struct;

struct PrivateLib01NestedStruct {
    pub x: u64,
    y: u64,
}

impl PrivateLib01NestedStruct {
    //fn new(s: PrivateLib01Struct) -> Self {
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

pub struct PublicLib01NestedStruct {
    pub x: u64,
    y: u64,
}

impl PublicLib01NestedStruct {
    //fn new(s: PrivateLib01Struct) -> Self {
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

fn poke<T>(_x: T) { }