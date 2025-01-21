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


#[duplicate_item(
    module         ref_type(type) reference(value) ref_mut(value);
    [matchers]     [&'a type]     [&value]         [value];
    [matchers_mut] [&'a mut type] [&mut value]     [ref mut value];
)]
mod module {
    use super::*;

    /// This is some comment that comments on [function_1].
    #[doc = "This is additional line on [function_1]."]
    pub fn function_1<'a, F>(s: ref_type([S]), f: F) -> Option<ref_type([u8])>
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

    /// This is some comment that comments on [function_2].
    #[doc = "This is additional line on [function_2]."]
    pub fn function_2<'a, F>(s: ref_type([S]), f: F) -> Option<ref_type([u8])>
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
}

fn main() {
    let mut s = S { x: 0, o: Some(0) };
    let _ = filter(&s, |_| true);
    let _ = matchers::function_1(&s, |_| true);
    let _ = matchers::function_2(&s, |_| true);

    let x = filter_mut(&mut s, |_| true).unwrap();
    *x = 1;

    let x = matchers_mut::function_1(&mut s, |_| true).unwrap();
    *x = 2;

    let x = matchers_mut::function_2(&mut s, |_| true).unwrap();
    *x = 3;
}