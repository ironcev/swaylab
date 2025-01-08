library;

pub fn play() {
    let a = [return 0u64];
    //      ^^^^^^^^^^^^^
    //      Internal compiler error: UnknownType { span: Span { src (ptr): 0x5555cdba9440, source_id: Some(SourceId { id: 67 }), start: 40, end: 53, as_str(): "[return 0u64]" } }

    let a = (return 0u64, return 1u64);
    // Internal compiler error: UnknownType { span: Span { src (ptr): 0x55cae80b7b30, source_id: None, start: 0, end: 23, as_str(): "unknown source location" } }

    if return 0u64 {
        0
    };
    //Mismatched types.
    //expected: ()
    //found:    numeric.
    //help: The two branches of an if expression must return the same type.
    
    let a = return 0u64;
    //      ^^^^^^^^^^^
    //      Internal compiler error: UnknownType { span: Span { src (ptr): 0x56496e7d32b0, source_id: Some(SourceId { id: 67 }), start: 677, end: 688, as_str(): "return 0u64" } }
    
    let _ = match return 0u64 {
        _ => 0,
    };
    // Unimplemented feature: matching on this type is unsupported right now

    log(return 0);
}
