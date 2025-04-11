script;

fn main() {
    // log(1, 2);
    // ^^^ Function "log" expects 1 argument but you provided 2.
    __log(1, 2);
    // error: Function "encode" expects 1 argument but you provided 2.
    // __addr_of([1u8], [2u8])
    // ^^^^^^^^^^^^^^^^^^^^^^^ Call to "addr_of" expects 1 arguments
}