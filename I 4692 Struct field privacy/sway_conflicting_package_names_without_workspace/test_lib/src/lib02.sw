library;

pub mod lib02_nested;

struct Lib02PrivateStruct {
    x: u64,
    y: u64,
}

impl Lib02PrivateStruct {
    fn use_me(self) {
        poke(self.x);
        poke(self.y);
    }
}

pub struct Lib02PublicStruct {
    x: u64,
    y: u64,
}

impl Lib02PublicStruct {
    fn use_me(self) {
        poke(self.x);
        poke(self.y);
    }
}

pub fn use_me() {
    let s = Lib02PrivateStruct { x: 0, y: 0 };
    s. use_me();

    let s = Lib02PublicStruct { x: 0, y: 0 };
    s. use_me();
}

fn poke<T>(_x: T) { }