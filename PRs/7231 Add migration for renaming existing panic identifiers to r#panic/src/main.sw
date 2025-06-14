script;

mod functions;
mod structs;
mod vars;

fn main() -> u64 {
    let _ = functions::panic();

    let panic = structs::play();
    let panic = functions::play();
    let panic = vars::play();

    panic
}
