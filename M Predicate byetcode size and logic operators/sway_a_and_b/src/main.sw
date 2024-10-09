predicate;

fn main() -> bool {
    // and_2(true, false)
    and_3(true, false, true)
}

#[inline(never)]
fn and_2(a: bool, b: bool) -> bool {
    a && b

// fn and_2_1(a !16: bool, b !17: bool) -> bool, !21 {
//     entry(a: bool, b: bool):
//     cbr a, block0(), block1(a), !22

//     block0():
//     br block1(b), !22

//     block1(v0: bool):
//     ret bool v0
// }

// move $r0 $$arg0               ; save argument 0 (a)
// move $r1 $$arg1               ; save argument 1 (b)
// move $r2 $$reta               ; save return address
// jnzf $r0 $zero i1
// jmpf $zero i1
// move $r0 $r1                  ; move parameter from branch to block argument
// move $$retv $r0               ; set return value
}

#[inline(never)]
fn and_3(a: bool, b: bool, c: bool) -> bool {
    a && b && c

// fn and_3_1(a !17: bool, b !18: bool, c !19: bool) -> bool, !23 {
//     entry(a: bool, b: bool, c: bool):
//     cbr a, block0(), block1(a), !24

//     block0():
//     br block1(b), !24

//     block1(v0: bool):
//     cbr v0, block2(), block3(v0), !25

//     block2():
//     br block3(c), !25

//     block3(v1: bool):
//     ret bool v1
// }

// move $r0 $$arg0               ; save argument 0 (a)
// move $r1 $$arg1               ; save argument 1 (b)
// move $r2 $$arg2               ; save argument 2 (c)
// move $r3 $$reta               ; save return address
// jnzf $r0 $zero i1
// jmpf $zero i1
// move $r0 $r1                  ; move parameter from branch to block argument
// jnzf $r0 $zero i1
// jmpf $zero i1
// move $r0 $r2                  ; move parameter from branch to block argument
// move $$retv $r0               ; set return value
}
