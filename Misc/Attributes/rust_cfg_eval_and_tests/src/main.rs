#[inline(sometimes)]
#[cfg(target_os = "windows")]
// #[cfg(target_os = "linux")]
fn fun() -> bool {
    a + b
}

#[cfg(rubbish)]
// warning: unexpected `cfg` condition name: `rubbish`
fn fun() -> bool {
    a + b
}

#[cfg(target_os = "rubbish")]
// warning: unexpected `cfg` condition value: `rubbish`
fn fun() -> bool {
    a + b
}

#[test]
fn test() {
    a + b
}

fn main() {
    println!("This works!");
}