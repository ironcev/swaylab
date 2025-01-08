script;

fn main() { }

pub trait New {
    fn new() -> Self;
}

pub trait ZeroSize { }

struct EmptyStruct {}

impl Eq for EmptyStruct {
    fn eq(self, other: Self) -> bool {
        true
    }
}

impl New for EmptyStruct {
    fn new() -> Self {
        EmptyStruct { }
    }
}

impl ZeroSize for EmptyStruct { }

impl New for [u64;0] {
    fn new() -> Self {
        []
    }
}

impl Eq for [u64;0] {
    fn eq(self, other: Self) -> bool {
        true
    }
}

impl ZeroSize for [u64;0] { }

#[test]
fn mcpi_issue_empty_struct() {
   reference_zero_sized_local_var_and_value::<EmptyStruct>();
}

#[test]
fn mcpi_issue_empty_array() {
   reference_zero_sized_local_var_and_value::<[u64;0]>();
}

#[test]
fn mcpi_issue_all_inlined() {
   reference_zero_sized_local_var_and_value::<EmptyStruct>();
   reference_zero_sized_local_var_and_value::<[u64;0]>();
}

#[inline(always)]
fn reference_zero_sized_local_var_and_value<T>()
    where T: Eq + New + ZeroSize
{
    assert(__size_of::<T>() == 0);

    let mut x = T::new();

    let r_x_1 = &x;
    let r_x_2 = &x;
    let r_val = &T::new();

    let r_x_1_ptr = asm(r: r_x_1) { r: raw_ptr };
    let r_x_2_ptr = asm(r: r_x_2) { r: raw_ptr };
    let r_val_ptr = asm(r: r_val) { r: raw_ptr };

    assert(r_x_1_ptr == r_x_2_ptr);

    let r_x_1_ptr_val = r_x_1_ptr.read::<T>();
    let r_x_2_ptr_val = r_x_2_ptr.read::<T>();
    let r_x_val_val = r_val_ptr.read::<T>();

    assert(r_x_1_ptr_val == x);
    assert(r_x_2_ptr_val == x);
    assert(r_x_val_val == T::new());

    assert(*r_x_1 == x);
    assert(*r_x_2 == x);
    assert(*r_val == T::new());
}