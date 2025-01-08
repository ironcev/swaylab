library;

/// Naive box.
pub struct NBox<T> {
    val: T,
}

impl<T> NBox<T> {
    pub fn new(t: T) -> Self {
        Self { val: t }
    }
}

/// Pointer box.
pub struct PBox<T> {
    ptr: raw_ptr,
}

impl<T> PBox<T> {
    pub fn new(t: T) -> Self {
        Self { ptr: __addr_of(t) }
    }

    pub fn val(self) -> T {
        self.ptr.read::<T>()
    }
}