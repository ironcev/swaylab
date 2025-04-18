script;

// use std::raw_slice::*;

impl raw_slice {
    #[inline(never)]
    fn into_parts(self) -> (raw_ptr, u64) {
        asm(ptr: self) {
            ptr: (raw_ptr, u64)
        }
    }
}

impl (u64, u64) {
    #[inline(never)]
    fn into_self(self) -> (u64, u64) {
        asm(ptr: self) {
            ptr: (u64, u64)
        }
    }
}

fn main() {
    // let slice = asm(ptr: (0, 0)) { ptr: raw_slice };
    // let parts = into_parts(slice);
    // let parts = slice.into_parts();

    // poke(slice);
    // poke(parts);

    // let agg = asm(ptr: (0, 0)) { ptr: (u64, u64) };
    let agg = (0, 0).into_self();
    poke(agg);
}

#[inline(never)]
fn poke<T>(_t: T) { }

#[inline(never)]
fn into_parts(slice: raw_slice) -> (raw_ptr, u64) {
    asm(ptr: slice) {
        ptr: (raw_ptr, u64)
    }
}

#[test]
fn test_slice_address() {
    let slice = asm(ptr: (0, 0)) { ptr: raw_slice };
    let slice_addr = __addr_of(slice);
    log(asm(ptr: slice_addr) { ptr: u64 });
    log(asm(ptr: slice.ptr()) { ptr: u64 });
}