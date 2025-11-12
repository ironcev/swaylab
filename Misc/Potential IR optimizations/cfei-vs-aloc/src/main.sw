script;

fn main() { }

fn cfei() {
    asm() {
        cfei i100;
        cfsi i100;
    }
}

fn aloc() {
    asm(size: 100) {
        aloc size;
    }
}

#[test]
fn bench_baseline() {
    let mut i = 0;
    while i < 1_000 {
        i += 1;
    }
}

#[test]
fn bench_cfei() {
    let mut i = 0;
    while i < 1_000 {
        cfei();
        i += 1;
    }
}

#[test]
fn bench_aloc() {
    let mut i = 0;
    while i < 1_000 {
        aloc();
        i += 1;
    }
}
