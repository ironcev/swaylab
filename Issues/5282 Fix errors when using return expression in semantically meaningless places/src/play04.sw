library;

pub fn play() -> u64 {
    let a = [return 0u64, return 1u64];
    //      ^^^^^^^^^^^^^^^^^^^^^^^^^^ Internal compiler error: UnknownType { span: Span { src (ptr): 0x55b116a61860, source_id: Some(SourceId { id: 3145808 }), start: 45, end: 71, as_str(): "[return 0u64, return 1u64]" } }

    let x = 123u64;
    log(x);

    x
}
