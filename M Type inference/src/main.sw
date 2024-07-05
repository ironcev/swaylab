script;

fn main() -> u8 {
    let x = 123;
    fn_with_generic_arg(x);
    x
}

fn fn_with_generic_arg<T>(_arg: T) { }