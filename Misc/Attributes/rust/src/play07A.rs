pub struct S {
    v: Vec::<u64>,
}

#[deprecated]
pub type SAlias = S;

#[allow(dead_code)]
pub fn fun() {
    let _ = S { v: vec![ ]};
    let _ = SAlias { v: vec![ ]};
}
