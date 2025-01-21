use duplicate::duplicate_item;

struct S {
    x: u8,
    o: Option<u8>,
}

#[duplicate_item(
    function     ref_type(type) reference(value) ref_mut(value);
    [filter]     [&'a type]     [&value]         [value];
    [filter_mut] [&'a mut type] [&mut value]     [ref mut value];
)]
/// This is some comment that comments on [function].
#[doc = "This is additional line on [function]."]
fn function<'a, F>(s: ref_type([S]), f: F) -> Option<ref_type([u8])>
where F: Fn(&ref_type([S])) -> bool + Copy + 'a
{
    if let Some(ref_mut([_x])) = s.o {
        if f(&s) {
            Some(reference([s.x]))
        } else {
            None
        }
    } else {
        None
    }
}

fn main() {
    let mut s = S { x: 0, o: None };
    let _ = filter(&s, |_| true);

    let x = filter_mut(&mut s, |_| true).unwrap();
    *x = 1;
}