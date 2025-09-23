library;

pub struct Struct { }

trait Trait {
    fn friendly_fn_in_trait(self) -> Self;
} {
    fn friendly_provided_method_in_trait(ref mut self) -> (b256, Self) {
        panic;
    }

    fn friendly_provided_fn_in_trait(s: Struct, ref mut x: u8) -> (b256, Self) {
        panic;
    }
}

impl Trait for Struct {
    fn friendly_fn_in_trait(self) -> Self {
        panic;
    }
}

impl Struct {
    pub fn friendly_fn_in_struct() -> (b256, Self) {
        panic;
    }

    pub fn friendly_method_in_struct(self) {
        panic;
    }
}

pub fn friendly_fn_in_module(ref mut x: u256) -> [b256; 0] {
    panic;
}

pub fn play() {
    Struct {}.friendly_fn_in_trait();
    let _ = Struct::friendly_fn_in_struct();
    let s = Struct {};
    let mut x: u8 = 0;
    let _ = Struct::friendly_provided_fn_in_trait(s, x);
    Struct {}.friendly_method_in_struct();
    let _ = Struct {}.friendly_provided_method_in_trait();
    let mut x: u256 = 0;
    friendly_fn_in_module(x);
}
