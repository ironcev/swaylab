library;

const EXAMPLE_CONST = 0;

pub fn play() {
    match EXAMPLE_CONST {
        _ => {}
    }

    match EXAMPLE_CONST {
        EXAMPLE_CONST => {}
        _ => {}
    }

    if let EXAMPLE_CONST = EXAMPLE_CONST {}
}
