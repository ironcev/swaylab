// Taken over from: sway/test/src/ir_generation/tests/shadowed_struct_init.sw
script;

struct S {
    a: bool,
    b: bool,
}

fn new(a: bool, b: bool) -> S {
    let a = false;
    let b = true;
    S {
        a: a,
        b: b,
    }
}

fn main() {
    new(true, false);
}