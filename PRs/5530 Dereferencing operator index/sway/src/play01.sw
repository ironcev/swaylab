library;

pub fn play() {
    let u64_var = 0;
    let _ = u64_var[1];

    let not_array = 0;

    let _ = not_array[1];
    //      ^^^^^^^^^^^^ Module "core::ops" could not be found.
    //      ^^^^^^^^^^^^ No method named "index" found for type "u64".

    let array = [1, 2, 3];

    let _ = array[true];

    let _ = array[0];

    let r_array = &array;

    let _ = r_array[0];
}
