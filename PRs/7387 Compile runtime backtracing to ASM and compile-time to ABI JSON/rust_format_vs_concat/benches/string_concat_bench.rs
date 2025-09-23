use std::{borrow::Cow, vec};
use itertools::*;

use criterion::{black_box, criterion_group, criterion_main, BenchmarkId, Criterion};

// Test data for benchmarks
const SHORT_STR_A: &str = "hello";
const SHORT_STR_B: &str = "world";
const MEDIUM_STR_A: &str = "The quick brown fox jumps over";
const MEDIUM_STR_B: &str = "the lazy dog and runs away";
const LONG_STR_A: &str = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua";
const LONG_STR_B: &str = "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat";

fn format_two_strings(a: &str, b: &str) -> String {
    format!("{}{}", a, b)
}

fn concat_two_strings(a: &str, b: &str) -> String {
    [a, b].concat()
}

fn join_two_strings(a: &str, b: &str) -> String {
    [a, b].join("")
}

fn format_enclosing(strs: &[&str]) -> String {
    let strs = strs.iter().map(|s| *s).collect::<Vec<_>>().join(", ");
    format!("<{}>", strs)
}

#[allow(unstable_name_collisions)]
fn collect_enclosing(strs: &[&str]) -> String {
    std::iter::once("<")
        .chain(strs.iter().map(|s| *s))
        .chain(std::iter::once(">"))
        .intersperse(", ")
        .collect::<String>()
}

#[allow(unstable_name_collisions)]
fn concat_enclosing(strs: &[&str]) -> String {
    std::iter::once("<")
        .chain(strs.iter().map(|s| *s))
        .chain(std::iter::once(">"))
        .intersperse(", ")
        .collect::<Vec<_>>().concat()
}

fn push_str_two_strings(a: &str, b: &str) -> String {
    let mut result = String::with_capacity(a.len() + b.len());
    result.push_str(a);
    result.push_str(b);
    result
}

fn push_str_new_str_two_strings(a: &str, b: &str) -> String {
    let mut result = String::new();
    result.push_str(a);
    result.push_str(b);
    result
}

fn push_vec_cow_two_strings(a: &str, b: &str) -> String {
    let mut vec = Vec::<Cow<str>>::new();
    vec.push(a.into());
    vec.push(b.into());
    vec.concat()
}

// Benchmark functions for multiple string concatenation
fn format_multiple_strings(strings: &[&str]) -> String {
    match strings.len() {
        2 => format!("{}{}", strings[0], strings[1]),
        3 => format!("{}{}{}", strings[0], strings[1], strings[2]),
        4 => format!("{}{}{}{}", strings[0], strings[1], strings[2], strings[3]),
        5 => format!("{}{}{}{}{}", strings[0], strings[1], strings[2], strings[3], strings[4]),
        _ => strings.iter().map(|s| *s).collect::<String>(),
    }
}

fn concat_multiple_strings(strings: &[&str]) -> String {
    strings.concat()
}

fn join_multiple_strings(strings: &[&str]) -> String {
    strings.join("")
}

fn push_str_multiple_strings(strings: &[&str]) -> String {
    let total_len: usize = strings.iter().map(|s| s.len()).sum();
    let mut result = String::with_capacity(total_len);
    for s in strings {
        result.push_str(s);
    }
    result
}

fn push_str_new_str_multiple_strings(strings: &[&str]) -> String {
    let mut result = String::new();
    for s in strings {
        result.push_str(s);
    }
    result
}

fn push_vec_cow_multiple_strings(strings: &[&str]) -> String {
    let mut vec = Vec::<Cow<str>>::new();
    for s in strings {
        vec.push((*s).into());
    }
    vec.concat()
}

// Benchmark for two strings with different sizes
fn bench_two_strings(c: &mut Criterion) {
    let test_cases = [
        ("short", SHORT_STR_A, SHORT_STR_B),
        ("medium", MEDIUM_STR_A, MEDIUM_STR_B),
        ("long", LONG_STR_A, LONG_STR_B),
    ];

    let mut group = c.benchmark_group("two_strings");
    
    for (size, a, b) in &test_cases {
        group.bench_with_input(
            BenchmarkId::new("format", size),
            &(a, b),
            |bench, (a, b)| {
                bench.iter(|| format_two_strings(black_box(a), black_box(b)))
            },
        );

        group.bench_with_input(
            BenchmarkId::new("concat", size),
            &(a, b),
            |bench, (a, b)| {
                bench.iter(|| concat_two_strings(black_box(a), black_box(b)))
            },
        );

        group.bench_with_input(
            BenchmarkId::new("join", size),
            &(a, b),
            |bench, (a, b)| {
                bench.iter(|| join_two_strings(black_box(a), black_box(b)))
            },
        );

        group.bench_with_input(
            BenchmarkId::new("push_str", size),
            &(a, b),
            |bench, (a, b)| {
                bench.iter(|| push_str_two_strings(black_box(a), black_box(b)))
            },
        );

        group.bench_with_input(
            BenchmarkId::new("push_str_new_str", size),
            &(a, b),
            |bench, (a, b)| {
                bench.iter(|| push_str_new_str_two_strings(black_box(a), black_box(b)))
            },
        );

        group.bench_with_input(
            BenchmarkId::new("vec_cow", size),
            &(a, b),
            |bench, (a, b)| {
                bench.iter(|| push_vec_cow_two_strings(black_box(a), black_box(b)))
            },
        );
    }
    
    group.finish();
}

// Benchmark for multiple strings
fn bench_multiple_strings(c: &mut Criterion) {
    let test_cases = [
        ("2_short", vec![SHORT_STR_A, SHORT_STR_B]),
        ("3_short", vec![SHORT_STR_A, SHORT_STR_B, "!"]),
        ("4_short", vec![SHORT_STR_A, " ", SHORT_STR_B, "!"]),
        ("5_short", vec!["Hello", " ", "beautiful", " ", "world"]),
        ("2_medium", vec![MEDIUM_STR_A, MEDIUM_STR_B]),
        ("3_medium", vec![MEDIUM_STR_A, " ", MEDIUM_STR_B]),
        ("2_long", vec![LONG_STR_A, LONG_STR_B]),
    ];

    let mut group = c.benchmark_group("multiple_strings");
    
    for (name, strings) in &test_cases {
        let strings_slice: Vec<&str> = strings.iter().map(|s| *s).collect();
        
        group.bench_with_input(
            BenchmarkId::new("format", name),
            &strings_slice,
            |bench, strings| {
                bench.iter(|| format_multiple_strings(black_box(strings)))
            },
        );

        group.bench_with_input(
            BenchmarkId::new("concat", name),
            &strings_slice,
            |bench, strings| {
                bench.iter(|| concat_multiple_strings(black_box(strings)))
            },
        );

        group.bench_with_input(
            BenchmarkId::new("join", name),
            &strings_slice,
            |bench, strings| {
                bench.iter(|| join_multiple_strings(black_box(strings)))
            },
        );

        group.bench_with_input(
            BenchmarkId::new("push_str", name),
            &strings_slice,
            |bench, strings| {
                bench.iter(|| push_str_multiple_strings(black_box(strings)))
            },
        );

        group.bench_with_input(
            BenchmarkId::new("push_str_new_str", name),
            &strings_slice,
            |bench, strings| {
                bench.iter(|| push_str_new_str_multiple_strings(black_box(strings)))
            },
        );

        group.bench_with_input(
            BenchmarkId::new("vec_cow", name),
            &strings_slice,
            |bench, strings| {
                bench.iter(|| push_vec_cow_multiple_strings(black_box(strings)))
            },
        );
    }
    
    group.finish();
}

// Benchmark with variable number of strings
fn bench_variable_count(c: &mut Criterion) {
    let base_strings = vec!["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"];
    
    let mut group = c.benchmark_group("variable_count");
    
    for count in [2, 3, 5, 10] {
        let strings: Vec<&str> = base_strings.iter().take(count).copied().collect();
        
        group.bench_with_input(
            BenchmarkId::new("format", count),
            &strings,
            |bench, strings| {
                bench.iter(|| format_multiple_strings(black_box(strings)))
            },
        );

        group.bench_with_input(
            BenchmarkId::new("concat", count),
            &strings,
            |bench, strings| {
                bench.iter(|| concat_multiple_strings(black_box(strings)))
            },
        );

        group.bench_with_input(
            BenchmarkId::new("join", count),
            &strings,
            |bench, strings| {
                bench.iter(|| join_multiple_strings(black_box(strings)))
            },
        );

        group.bench_with_input(
            BenchmarkId::new("push_str", count),
            &strings,
            |bench, strings| {
                bench.iter(|| push_str_multiple_strings(black_box(strings)))
            },
        );
    }
    
    group.finish();
}

fn bench_enclosing(c: &mut Criterion) {
    let test_cases = [
        ("short", [SHORT_STR_A, SHORT_STR_B]),
        ("medium", [MEDIUM_STR_A, MEDIUM_STR_B]),
    ];

    let mut group = c.benchmark_group("enclosing");
    
    for (size, iter) in &test_cases {
        group.bench_with_input(
            BenchmarkId::new("format", size),
            &iter,
            |bench, iter| {
                bench.iter(|| format_enclosing(black_box(*iter)))
            },
        );
    }

    for (size, iter) in &test_cases {
        group.bench_with_input(
            BenchmarkId::new("collect", size),
            &iter,
            |bench, iter| {
                bench.iter(|| collect_enclosing(black_box(*iter)))
            },
        );
    }

    for (size, iter) in &test_cases {
        group.bench_with_input(
            BenchmarkId::new("concat", size),
            &iter,
            |bench, iter| {
                bench.iter(|| concat_enclosing(black_box(*iter)))
            },
        );
    }
    
    group.finish();
}

fn return_cow(a: &str) -> Cow<str> {
    a.into()
}

fn return_string(a: &str) -> String {
    a.into()
}

fn return_cow_of_string(a: &str) -> Cow<str> {
    a.to_string().into()
}

fn bench_cow(c: &mut Criterion) {
    let test_cases = [
        ("short", SHORT_STR_A),
        ("medium", MEDIUM_STR_A),
        ("long", LONG_STR_A),
    ];

    let mut group = c.benchmark_group("cow_vs_string");

    // for (size, val) in &test_cases {
    //     group.bench_with_input(
    //         BenchmarkId::new("return_cow", size),
    //         &val,
    //         |bench, &&val| {
    //             bench.iter(|| return_cow(black_box(val)))
    //         },
    //     );
    // }

    // for (size, val) in &test_cases {
    //     group.bench_with_input(
    //         BenchmarkId::new("return_string", size),
    //         &val,
    //         |bench, &&val| {
    //             bench.iter(|| return_string(black_box(val)))
    //         },
    //     );
    // }

    for (size, val) in &test_cases {
        group.bench_with_input(
            BenchmarkId::new("return_cow_of_string", size),
            &val,
            |bench, &&val| {
                bench.iter(|| return_cow_of_string(black_box(val)))
            },
        );
    }
    
    group.finish();
}

criterion_group!(
    benches,
    bench_two_strings,
    bench_multiple_strings,
    bench_variable_count,
    bench_enclosing,
    bench_cow,
);
criterion_main!(benches);
