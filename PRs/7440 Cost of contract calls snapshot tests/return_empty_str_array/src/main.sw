script;

trait T {
    fn ret_string_array() -> str[0];
    fn ret_asm_zero() -> str[0];
}

impl T for str[0] {
    // #[inline(never)]
    fn ret_string_array() -> str[0] {
        __to_str_array("")
    }
    // #[inline(never)]
    fn ret_asm_zero() -> str[0] {
        asm(s: 0) {
            s: str[0]
        }
    }
}

type MyType = str[0];

fn main() -> str[0] {
    let result = MyType::ret_string_array(); // 256 bytes in debug, 208 in release.
    // let result = MyType::ret_asm_zero(); // 256 bytes in debug, 208 in release.
    result
}

// ret_string_array (inlined):
// pub fn ret_string_array_1(__ret_value: ptr string<0>) -> ptr string<0>, !62 {
//     local string<0> __const = const string<0> ""

//     entry(__ret_value: ptr string<0>):
//     v0 = get_local ptr string<0>, __const
//     mem_copy_val __ret_value, v0
//     ret ptr string<0> __ret_value
// }

// ret_string_array (inlined):
// entry_orig fn main_0(__ret_value: ptr string<0>) -> ptr string<0>, !57 {
//     local string<0> __const = const string<0> ""

//     entry(__ret_value: ptr string<0>):
//     v0 = get_local ptr string<0>, __const, !58
//     mem_copy_val __ret_value, v0
//     ret ptr string<0> __ret_value
// }