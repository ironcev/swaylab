library;

const X = return 1;

fn return_addition_of_naked_returns() {
    return + return
    //     ^ Expected an expression.
}

fn return_addition_of_returns() -> u64 {
    return 1 + return 2 // Works fine.
}

fn return_return() {
    return return return // Works fine.
}

pub fn play() {
    let a = [return];

    let a = (return, return);

    if return {
        0
    };
    
    let a = return;
    
    let _ = match return {
        _ => 0,
    };

    log(return);

    return_addition_of_naked_returns();

    return_addition_of_returns();

    return_return();
}
