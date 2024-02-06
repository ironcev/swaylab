mod top;

fn main() {
    top::middle::use_private_middle_struct();
    top::middle::bottom::use_private_bottom_struct();
}
