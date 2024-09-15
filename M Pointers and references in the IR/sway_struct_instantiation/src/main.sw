script;

struct S {}

fn module_fn() {
    let _ = S {};
    let _ = S {};
}

fn main() {
    module_fn();
}
