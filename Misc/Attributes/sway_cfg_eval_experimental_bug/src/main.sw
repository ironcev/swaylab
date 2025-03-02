script;

#[cfg(experimental_new_encoding = true)]
#[cfg(program_type = "library")]
fn fun() -> bool {
     true
}

fn main() {
    let _ = fun();
}