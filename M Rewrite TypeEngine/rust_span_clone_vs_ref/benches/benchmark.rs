use criterion::{black_box, criterion_group, criterion_main, BenchmarkId, Criterion};
use rust_span_clone_vs_ref::*;

// fn bench_get_source_id(c: &mut Criterion) {
//     let mut group = c.benchmark_group("Get source ID");
//     let i = create_ident();
//     group.bench_with_input(BenchmarkId::new("With clone", "<ident>"), &&i, 
//         |b, i| b.iter(|| with_clone(*i)));
//     group.bench_with_input(BenchmarkId::new("With ref", "<ident>"), &&i, 
//         |b, i| b.iter(|| with_ref(*i)));
//     group.finish();
// }

fn bench_get_source_id_in_loop(c: &mut Criterion) {
    let mut group = c.benchmark_group("Get source ID");
    let ident = create_ident();
    let iters = [1, 1000, 1000_000];
    for iter in iters {
        let input = (&ident, iter);

        group.bench_with_input(BenchmarkId::new("With clone", iter), &&input, 
            |b, input| b.iter(|| with_clone_in_loop(input.0, input.1)));
        group.bench_with_input(BenchmarkId::new("With ref", iter), &&input, 
            |b, input| b.iter(|| with_ref_in_loop(input.0, input.1)));
    }
    group.finish();
}

// criterion_group!(benches, bench_get_source_id);
criterion_group!(benches, bench_get_source_id_in_loop);
criterion_main!(benches);