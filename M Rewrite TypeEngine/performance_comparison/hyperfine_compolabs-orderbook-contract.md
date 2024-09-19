# Hyperfine Benchmarks for `compolabs-orderbook-contract`

```
hyperfine --warmup 1 --runs 3 '~/p/sway/target/release/forc build --release -p ~/p/compolabs-orderbook-contract/'
```

## Baseline

  Time (mean ± σ):     11.929 s ±  0.413 s    [User: 10.075 s, System: 1.419 s]
  Range (min … max):   11.630 s … 12.400 s    3 runs

## Step #1

  Time (mean ± σ):      8.357 s ±  0.375 s    [User: 7.140 s, System: 0.816 s]
  Range (min … max):    8.017 s …  8.759 s    3 runs

## Step #2

  Time (mean ± σ):      7.742 s ±  0.893 s    [User: 6.565 s, System: 0.775 s]
  Range (min … max):    6.741 s …  8.456 s    3 runs

