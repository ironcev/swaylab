# String Concatenation Benchmark: format! vs slice.concat()

This project benchmarks different methods of string concatenation in Rust, with a focus on comparing:
- `format!("{}{}", a, b)` macro
- `[a, b].concat()` slice method

## Methods Compared

1. **format! macro**: Uses Rust's formatting infrastructure
2. **slice.concat()**: Concatenates elements of a slice
3. **slice.join("")**: Joins slice elements with empty separator
4. **String::push_str()**: Manual string building with capacity pre-allocation

## Benchmark Categories

### Two String Concatenation
Compares methods for concatenating exactly two strings with different sizes:
- Short strings (~5-10 characters)
- Medium strings (~25-30 characters)  
- Long strings (~100+ characters)

### Multiple String Concatenation
Tests concatenation of 2-5 strings of varying lengths.

### Variable Count
Benchmarks performance scaling from 2 to 10 strings.

## Running the Benchmarks

```bash
# Run all benchmarks
cargo bench

# Run specific benchmark group
cargo bench two_strings
cargo bench multiple_strings
cargo bench variable_count

# Generate HTML reports (saved to target/criterion/)
cargo bench -- --output-format html
```

## Running the Demo

```bash
# Run the demonstration program
cargo run

# Run tests
cargo test
```

## Expected Results

Generally, you can expect:
- **slice.concat()** to be faster for most cases, especially with multiple strings
- **format!** to have more overhead due to formatting infrastructure
- **String::push_str()** with pre-allocation to be fastest for known total size
- Performance differences to be more pronounced with more strings or larger strings

## Benchmark Output

The benchmarks will show:
- Execution time for each method
- Throughput comparisons
- Statistical analysis of performance variance
- HTML reports with detailed graphs (when using `--output-format html`)

## Understanding the Results

- **Lower time** = better performance
- **Higher throughput** = better performance
- Look for consistent patterns across different string sizes
- Consider both mean time and confidence intervals
