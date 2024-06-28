script;

#[inline(never)]
fn main() {
    // play01();
    play02();
}

#[inline(always)]
fn play01() {
    __revert(0)
}

// .program:
// .2                                      ; --- start of function: main_0 ---
// pshl i1                                 ; Save registers 16..40
// pshh i524288                            ; Save registers 40..64
// move $$locbase $sp                      ; save locals base register for main_0
// cfei i0                                 ; allocate 0 bytes for locals and 0 slots for call arguments.
// move $r0 $$reta                         ; save reta
// .6
// rvrt $zero
// .3
// cfsi i0                                 ; free 0 bytes for locals and 0 slots for extra call arguments.
// move $$reta $r0                         ; restore reta
// poph i524288                            ; Restore registers 40..64
// popl i1                                 ; Restore registers 16..40
// jmp $$reta                              ; return from call


#[inline(always)]
fn play02() {
    __revert(0);
    poke(65000);
}

#[inline(never)]
fn poke<T>(_x: T) { }