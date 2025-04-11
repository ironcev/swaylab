script;

fn main() -> bool {
    log(());
    log(log(0u64));
    log(__log(0u8));
    //     ^^^^^^^^^^ Internal compiler error: An attempt to get register for unknown Value.
    // __log(__log(0u8));
    //       ^^^^^^^^^^ Internal compiler error: An attempt to get register for unknown Value.
    true
}