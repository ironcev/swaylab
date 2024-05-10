script;

// fn encode() {}
// fn abi_decode() {}

configurable {
    X: u64 = play_while(),
    Y: () = (),
    Z: u64 = play_encode_buffer_append(),
    // A: u64 = play_encode_buffer_append_wrong_buffer_type(),
    // B: u64 = play_encode_buffer_append_wrong_data_type(),
    // C: u64 = play_encode_buffer_as_raw_slice_wrong_buffer_type(),
    FIRST: u64 = 0,
    // SECOND: u64 = FIRST + 1,
}

fn play_while() -> u64 {
    // while true { }
    0
}

fn play_encode_buffer_append() -> u64 {
    let buffer = __encode_buffer_empty();
    let buffer = __encode_buffer_append(buffer, 1u8);
    let buffer = __encode_buffer_append(buffer, true);
    // let buffer = __encode_buffer_append(buffer, ());

    0
}

fn play_encode_buffer_append_wrong_buffer_type() -> u64 {
    // let buffer = __encode_buffer_append(true, 1u8);
    let buffer = __encode_buffer_empty();
    let buffer = __encode_buffer_append(buffer, 1u8);

    0
}

fn play_encode_buffer_append_wrong_data_type() -> u64 {
    let buffer = __encode_buffer_empty();
    let buffer = __encode_buffer_append(buffer, 1u8);

    0
}

fn play_encode_buffer_as_raw_slice_wrong_buffer_type() -> u64 {
    __encode_buffer_as_raw_slice(true);

    0
}

// fn play_slice<T>(s: __slice[T], buffer: Buffer) where T: AbiEncode {
//    s[0].abi_encode(buffer);
//    // ^ This expression has type "__slice[T]", which is not an indexable type.
// }

fn main() {
    play_encode_buffer_append_wrong_buffer_type();
    // play_encode_buffer_append_wrong_data_type();
    // play_encode_buffer_as_raw_slice_wrong_buffer_type();

    // let _x = FIRST;
}
