library;

struct S {}

fn by_ref(ref mut _s: S) {
}

pub fn play() {
    let _ = & &0;
    let _ = deref & &0;

    let _ = &&0;
    let _ = deref &&0;

    let _ = &0;
    let _ = deref &0;

    let _ = & 0;
    let _ = deref & 0;

    let _ = ref 0;
    let _ = deref ref 0;

    let _ = & &0;
    let _ = * & &0;
    let _ = *& &0;

    let _ = &&0;
    let _ = * &&0;
    let _ = *&&0;

    let _ = &0;
    let _ = * &0;
    let _ = *&0;

    let _ = & 0;
    let _ = * & 0;
    let _ = *& 0;
    let _ = *&0;

    let _ = ref 0;
    let _ = deref ref 0;

    let _ = 0u64 & 1u64;

    let _ = 0u64 & &1u64;

    let _ = 1u64 * 1u64;
    let _ = 1u64 * *1u64;

    let mut s = S {};
    by_ref(s);
}
