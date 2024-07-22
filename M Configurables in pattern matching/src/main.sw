script;

configurable {
    CONFIG_1: u8 = 123,
}

const CONST: u8 = 123;

fn main() {
    let _ = match 123 {
        CONFIG_1 => { CONFIG_1 }
        CONFIG_1 => { CONFIG_1 }
        some_var => { some_var }
        CONST => { CONST }
        _ => { 0 }
    };
}
