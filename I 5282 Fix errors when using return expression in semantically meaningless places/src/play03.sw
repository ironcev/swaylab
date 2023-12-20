library;

fn break_in_loops() {
    while true {
        break;
        continue;

        let _ = break; // Ok.
        let _ = [break, break]; // Ok.

        let _ = continue; // Ok.
        let _ = [continue, continue]; // Ok.
    }
}

fn break_outside_loops() {
    break;
    continue;

    let _ = break; // Ok.
    let _ = [break, break]; // Ok.

    let _ = continue; // Ok.
    let _ = [continue, continue];
    //      ^^^^^^^^^^^^^^^^^^^^ Internal compiler error: UnknownType { span: Span { src (ptr): 0x561903e4ac60, source_id: Some(SourceId { id: 3145808 }), start: 287, end: 307, as_str(): "[continue, continue]" } }
    // Please file an issue on the repository and include the code that triggered this error.
}

pub fn play() {
    break_in_loops();
    break_outside_loops();
}
