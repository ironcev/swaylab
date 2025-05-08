library;

struct S {
    val: u8,
}

impl S {
    fn val(self) -> u8 {
        self.val
    }

    #[inline(never)]
    fn eq(self, other: S) -> bool {
        // Empty: 96.
        // self.val() == other.val()    // 216 - 96 = 120.
        self.val == other.val        // 112 - 96 = 16.
        // true
    }
}

pub fn play() {
    let s = S { val: 0 };
    let _ = s.eq(s);
}
