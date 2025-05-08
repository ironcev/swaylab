library;

struct S {
    val: u8,
}

impl S {
    fn val(self) -> u8 {
        self.val
    }

    #[inline(never)]
    fn use_val(self) {
        // Empty: 88.
        // poke(self.val() + self.val());   // 248 - 88 = 160.
        // poke(self.val + self.val);       // 160 - 88 = 72.
        // let temp = self.val;
        // poke(temp + temp);               // 152 - 88 = 64.
        let temp = self.val();
        poke(temp + temp);                  // 152 - 88 = 64. As expected. `val()` call is inlined.
        // ()
    }
}

pub fn play() {
    let s = S { val: 0 };
    s.use_val();
}

fn poke(_x: u8) { }
