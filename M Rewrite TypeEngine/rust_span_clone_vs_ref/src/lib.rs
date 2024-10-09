use std::sync::Arc;

#[derive(Clone, Copy, PartialEq, Eq, Ord, PartialOrd)]
pub struct SourceId(u32);

#[derive(Clone, PartialEq, Eq, Ord, PartialOrd)]
pub struct Span {
    src: Arc<str>,
    start: usize,
    end: usize,
    source_id: Option<SourceId>,
}

impl Span {
    pub fn source_id(&self) -> Option<&SourceId> {
        self.source_id.as_ref()
    }
}

#[derive(Clone)]
pub struct Ident {
    name_override_opt: Option<Arc<String>>,
    span: Span,
    is_raw_ident: bool,
}

impl std::fmt::Display for Ident {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.write_str("")
    }
}

impl Ident {
    pub fn span(&self) -> Span {
        self.span.clone()
    }
    
    pub fn span_ref(&self) -> &Span {
        &self.span
    }
}

#[inline(always)]
pub fn with_clone(i: &Ident) -> Option<SourceId> {
    i.span().source_id().copied()
}

#[inline(always)]
pub fn with_clone_in_loop(i: &Ident, iter: usize) -> Option<SourceId> {
    let mut res = None;
    for _ in 0..iter {
        res = i.span().source_id().copied();
    }
    res
}

#[inline(always)]
pub fn with_ref(i: &Ident) -> Option<SourceId> {
    i.span_ref().source_id().copied()
}

#[inline(always)]
pub fn with_ref_in_loop(i: &Ident, iter: usize) -> Option<SourceId> {
    let mut res = None;
    for _ in 0..iter {
        res = i.span_ref().source_id().copied();
    }
    res
}

#[inline(never)]
pub fn create_ident() -> Ident {
    Ident {
        name_override_opt: None,
        span: Span {
            src: Arc::from(""),
            start: 0,
            end: 0,
            source_id: None,
        },
        is_raw_ident: false,
    }
}

#[inline(never)]
fn poke<T>(_t: T) {}

fn main() {
    let i = create_ident();
    //with_copy(&i);
    with_ref(&i);
}