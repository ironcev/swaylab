library;

fn dca_01() -> u64 {
    return 0;

    42*1
}

fn dca_02() -> u64 {
    return 0;

    return 42*2;
}

fn dca_03(a: u64) -> u64 {
    if a > 0 {
        return 0;
    }
    else {
        return 0;
    }

    return 42*3;
}

fn revert_01() -> u64 {
    __revert(0);

    42*1
}

fn revert_02() -> u64 {
    __revert(0);

    return 42*2;
}

fn revert_03(a: u64) -> u64 {
    if a > 0 {
        __revert(0);
    }
    else {
        return 0;
    }

    return 42*3;
}

pub fn play() -> () {
    let _ = dca_01();
    let _ = dca_02();
    let _ = dca_03(0);

    let _ = revert_01();
    let _ = revert_02();
    let _ = revert_03(0);
}
