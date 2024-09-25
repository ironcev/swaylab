# Hyperfine Benchmarks for `compolabs-orderbook-contract`

```
hyperfine --warmup 1 --runs 3 '~/p/sway/target/release/forc check -p ~/p/compolabs-orderbook-contract/'
```

## Baseline

  Time (mean ± σ):      8.995 s ±  0.297 s    [User: 7.126 s, System: 1.289 s]
  Range (min … max):    8.675 s …  9.262 s    3 runs

## Step #1: Add `id_of_<build-in type>` and `new_<replacable type>[_<options>]` methods.

   [Measured for `build` but not for `check` :-(]

## Step #2: Add singleton instances for `TypeInfo::Unknown` and `TypeInfo::Numeric`.

  Time (mean ± σ):      5.884 s ±  0.250 s    [User: 4.591 s, System: 0.765 s]
  Range (min … max):    5.604 s …  6.085 s    3 runs

## Step #3: Implement `is_changeable_type` for `TypeInfo::Enum` and `TypeInfo::Struct` and remove `TypeInfo` cloning.

  Time (mean ± σ):      5.868 s ±  0.402 s    [User: 4.734 s, System: 0.739 s]
  Range (min … max):    5.464 s …  6.268 s    3 runs

## Step #4: Implement zero-heap-allocations hashing and store `Arc<TypeSourceInfo>` in the `unchangeable_type_ids` map.

  Time (mean ± σ):      5.607 s ±  0.200 s    [User: 4.514 s, System: 0.703 s]
  Range (min … max):    5.377 s …  5.733 s    3 runs
