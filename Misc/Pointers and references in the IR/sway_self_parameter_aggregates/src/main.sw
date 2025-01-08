script;

struct S {
    x: u64,
    y: u64,
}

impl S {
    #[inline(never)]
    fn by_val(self) -> u64 {
        self.x + self.y
    }

    #[inline(never)]
    fn by_ref_mut(ref mut self) -> Self {
        self.x += self.y;
        self
    }
}

#[inline(never)]
fn main() {
    let mut x = S { x: 112233, y: 445566 };
    x.by_val();
    x.by_ref_mut();
}


//    Initial:
//    fn by_val_0(self !12: { u64, u64 }) -> u64, !14 {
//        entry(self: { u64, u64 }):
//        v0 = ptr_to_int self to u64
//        v1 = int_to_ptr v0 to ptr { u64, u64 }
//        v2 = const u64 0
//        v3 = get_elem_ptr v1, ptr u64, v2, !15
//        v4 = load v3
//        v5 = ptr_to_int self to u64
//        v6 = int_to_ptr v5 to ptr { u64, u64 }
//        v7 = const u64 1
//        v8 = get_elem_ptr v6, ptr u64, v7, !16
//        v9 = load v8
//        v10 = call add_1(v4, v9), !17
//        ret u64 v10
//    }
//
//    fn by_ref_mut_2(self !22: ptr { u64, u64 }) -> { u64, u64 }, !24 {
//        entry(self: ptr { u64, u64 }):
//        v0 = const u64 0
//        v1 = get_elem_ptr self, ptr u64, v0, !15
//        v2 = load v1
//        v3 = const u64 1
//        v4 = get_elem_ptr self, ptr u64, v3, !16
//        v5 = load v4
//        v6 = call add_1(v2, v5), !25
//        v7 = const u64 0
//        v8 = get_elem_ptr self, ptr u64, v7, !25
//        store v6 to v8, !25
//        v9 = load self
//        ret { u64, u64 } v9
//    }
//
//
//    Final:
//    fn by_val_0(self: ptr { u64, u64 }) -> u64, !9 {
//        entry(self: ptr { u64, u64 }):
//        v0 = ptr_to_int self to u64
//        v1 = int_to_ptr v0 to ptr { u64, u64 }
//        v2 = const u64 0
//        v3 = get_elem_ptr v1, ptr u64, v2, !10
//        v4 = load v3
//        v5 = ptr_to_int self to u64
//        v6 = int_to_ptr v5 to ptr { u64, u64 }
//        v7 = const u64 1
//        v8 = get_elem_ptr v6, ptr u64, v7, !11
//        v9 = load v8
//        v10 = add v4, v9, !12
//        ret u64 v10
//    }
//
//    fn by_ref_mut_2(self !13: ptr { u64, u64 }, __ret_value: ptr { u64, u64 }) -> ptr { u64, u64 }, !15 {
//        entry(self: ptr { u64, u64 }, __ret_value: ptr { u64, u64 }):
//        v0 = const u64 0
//        v1 = get_elem_ptr self, ptr u64, v0, !10
//        v2 = load v1
//        v3 = const u64 1
//        v4 = get_elem_ptr self, ptr u64, v3, !11
//        v5 = load v4
//        v6 = add v2, v5, !16
//        v7 = const u64 0
//        v8 = get_elem_ptr self, ptr u64, v7, !16
//        store v6 to v8, !16
//        mem_copy_val __ret_value, self
//        ret ptr { u64, u64 } __ret_value
//    }
