use std::time::Duration;

use indicatif::{MultiProgress, ProgressBar, ProgressStyle};

use rayon::prelude::*;

fn main() {
    let m = MultiProgress::new();
    let sty = ProgressStyle::with_template(
        "[{elapsed_precise}] {bar:40.cyan/blue} {pos:>7}/{len:7} {msg}",
    )
    .unwrap()
    .progress_chars("##-");

    let n = 200;
    let pb = m.add(ProgressBar::new(n));
    pb.set_style(sty.clone());
    pb.set_message("todo");

    let spinner_style = ProgressStyle::with_template("[{elapsed_precise}] {prefix:.bold.dim} {msg}")
    .unwrap();


    (0..n).into_par_iter().for_each(|x| {
        pb.inc(1);
        let m = m.clone();
        let bar = ProgressBar::new_spinner()
            .with_prefix("Running: ")
            .with_message(format!("test bla bla {x}"))
            .with_style(spinner_style.clone());

        let spinner = m.add(bar);
        spinner.enable_steady_tick(Duration::from_millis(100));

        let _ = intense_cpu_and_memory_work();

        if x % 4 == 0 {
            spinner.finish_with_message(format!("test bla bla {x} \tERROR"));
        }
    });

    pb.finish_with_message("Testing finished");
}

fn intense_cpu_and_memory_work() -> u64 {
    let mut vec = vec![];
    for i in 0..1024*1024*10u64 {
        vec.push(i);
        if vec.len() > 1024*1024 {
            vec.pop();
        }
    }

    vec.iter().map(|x| x / 1024 / 1024).sum()
}