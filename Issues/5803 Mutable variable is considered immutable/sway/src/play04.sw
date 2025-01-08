library;

type ArrayAlias = [u64;3];

pub fn play() {
    let a = [1u64, 2u64, 3u64];
    array(a);
    array_alias(a);
}

fn array(array: [u64;3]) {
    let _ = match array {
        _ => true,
    };
}

fn array_alias(array_alias: ArrayAlias) {
    let _ = match array_alias {
        _ => true,
    };
}