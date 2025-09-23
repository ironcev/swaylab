script;

trait TraitA {
  fn associated();
  fn method(self);
  fn different_associated();
  fn different_method(self);
}

trait TraitB {
  fn associated();
  fn method(self);
  fn different_associated(b: bool);
  fn different_method(self, b: bool);
}

struct Struct { }

impl Struct {
  fn associated() {}
  fn method(self) {}
  fn different_associated(_b: bool, _x: u64) {}
  fn different_method(self, _b: bool, _x: u64) {}
}

impl TraitA for Struct {
  fn associated() {}
  fn method(self) {}
  fn different_associated() {}
  fn different_method(self) {}
}

impl TraitB for Struct {
  fn associated() {}
  fn method(self) {}
  fn different_associated(_b: bool) {}
  fn different_method(self, _b: bool) {}
}

fn main() {
    Struct::associated(42);
    Struct {}.method(42);
    Struct::different_associated([42; 1]);
    Struct {}.different_method([42; 1]);
}
