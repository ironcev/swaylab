use rust_format_vs_concat::{format_concat, slice_concat, format_concat_multiple, slice_concat_multiple};

fn main() {
    println!("String Concatenation Comparison");
    println!("==============================");
    
    let a = "Hello";
    let b = "World";
    
    // Two string concatenation
    let format_result = format_concat(a, b);
    let slice_result = slice_concat(a, b);
    
    println!("Two strings: '{}' + '{}'", a, b);
    println!("format! result: '{}'", format_result);
    println!("slice.concat() result: '{}'", slice_result);
    println!("Results match: {}", format_result == slice_result);
    println!();
    
    // Multiple string concatenation
    let strings = &["Hello", " ", "beautiful", " ", "world", "!"];
    let format_multi = format_concat_multiple(strings);
    let slice_multi = slice_concat_multiple(strings);
    
    println!("Multiple strings: {:?}", strings);
    println!("format! result: '{}'", format_multi);
    println!("slice.concat() result: '{}'", slice_multi);
    println!("Results match: {}", format_multi == slice_multi);
    println!();
    
    println!("Run 'cargo bench' to see performance comparison!");
}
