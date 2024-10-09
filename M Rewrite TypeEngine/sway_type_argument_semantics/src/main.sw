script;

fn main() {
    let _: (_, ) = (0u8,);
    gen((0u8, ));
}

fn gen<T>(_t: (T,)) {}
