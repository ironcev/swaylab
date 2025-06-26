script;

const ARRAY: [u8; 3] = [11, 11, 11];
const STR_ARRAY: str[3] = __to_str_array("aaa");

fn main() {
    let array: [u8; 3] = [22, 22, 22];
    let str_array: str[3] = __to_str_array("bbb");

    poke(ARRAY);
    poke(STR_ARRAY);
    poke(array);
    poke(str_array);
}

#[inline(never)]
fn poke<T>(_t: T) { }