library;

#[cfg(storage_domains = true)]
pub fn fun() {}

#[storage(read_write)]
pub fn storage_fn() {}

#[inline(sometimes)]
pub fn inlined_or_not() { }