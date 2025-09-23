script;

mod no_trace_attributes;
mod with_trace_attributes;

fn main() {
    with_trace_attributes::first();
    no_trace_attributes::first();
    // with_trace_attributes::first();

    // if true {
    //     panic "Main function has panicked first time.";
    // } else if true {
    //     panic "Main function has panicked second time.";
    // } else {
    //     panic "Main function has panicked third time.";
    // }
}
