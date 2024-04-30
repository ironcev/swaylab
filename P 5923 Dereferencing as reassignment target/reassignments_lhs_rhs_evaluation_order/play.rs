fn main() {
    let mut array = [0, 0, 0];
    
    array[index("LHS", 0)] = index("RHS", 11);
    
    println!("{}", array[0]);
    
    println!("-------------------------");
    
    let mut i = 0;
    array[inc_i(&mut i)] = inc_i(&mut i);
    println!("{}", array[0]);
    println!("{}", array[1]);
    println!("{}", array[2]);
}

fn index(s: &str, i: usize) -> usize {
    println!("{s}");
    i
}

fn inc_i(i: &mut usize) -> usize {
    *i += 1;
    *i
}

// RHS
// LHS
// 11
// -------------------------
// 11
// 0
// 1
