use std::collections::HashSet;

#[derive(Eq, Hash, PartialEq)]
struct Struct {
    x: u32,
}

fn main() {
    let mut _x: HashSet<u32> = HashSet::new();
    _x.insert(0u32);

    let mut _x: HashSet<Struct> = HashSet::new();
    _x.insert(Struct { x: 0u32 });

    print!("Hello Hash!");
}
