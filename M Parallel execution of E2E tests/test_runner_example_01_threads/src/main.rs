use std::thread;
use std::time::Duration;

use indicatif::{MultiProgress, ProgressBar, ProgressStyle};

use rand::Rng;

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

    let spinner_style = ProgressStyle::with_template("{prefix:.bold.dim} {msg} {spinner}")
    .unwrap();

    let mut threads = vec![];

    for i in 0..n {
        thread::sleep(Duration::from_millis(15));
        if i == n / 3 {
            thread::sleep(Duration::from_secs(2));
        }
        pb.inc(1);
        let m = m.clone();
        let bar = ProgressBar::new_spinner()
            .with_prefix("Running: ")
            .with_message(format!("test bla bla {i}"))
            .with_style(spinner_style.clone());

        threads.push(thread::spawn(move || {
            let spinner = m.add(bar);
            spinner.enable_steady_tick(Duration::from_millis(100));
            thread::sleep(
                rand::thread_rng().gen_range(Duration::from_secs(1)..Duration::from_secs(5)),
            );
            if i % 4 == 0 {
                spinner.finish_with_message(format!("test bla bla {i} .. ERROR"));
            }
        }));
    }
    pb.finish_with_message("Testing finished");

    for thread in threads {
        let _ = thread.join();
    }
    // m.clear().unwrap();
}