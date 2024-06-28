script;

#[inline(never)]
fn main() {
    function(true);
    function(false);
}

#[inline(never)]
fn function(_b: bool) { }
