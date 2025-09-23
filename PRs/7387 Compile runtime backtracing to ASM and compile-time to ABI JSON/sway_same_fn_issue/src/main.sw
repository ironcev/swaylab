script;

mod module;

struct S {}

impl S {
    fn function() {
        panic "This is an error message.";
    }
}

fn function() {
    panic "This is an error message.";
}

fn main() {
    function();
    S::function();
    module::module_main();
}
