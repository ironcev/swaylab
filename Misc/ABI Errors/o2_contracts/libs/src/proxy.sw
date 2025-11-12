library;

/// Loads and executes external contract bytecode in the current context.
/// Used by proxy contracts to delegate execution to implementation contracts.
/// This function never returns - it transfers control to the loaded bytecode.
///
/// # Arguments
///
/// * `load_target` - The contract ID whose bytecode should be loaded and executed
///
/// # Safety
///
/// This function performs low-level memory operations and transfers control flow.
/// The loaded contract must be trusted as it will execute with the proxy's storage context.
#[inline(never)]
pub fn run_external_blob(load_target: ContractId) -> ! {
    asm(
        load_target: load_target,
        word,
        length,
        ssp_saved,
        cur_stack_size,
    ) {
        bsiz length load_target;
        move ssp_saved ssp;
        sub cur_stack_size sp ssp;
        cfs cur_stack_size;
        ldc load_target zero length i1;
        addi word zero i64;
        aloc word;
        sw hp ssp_saved i0;
    }
    __jmp_mem()
}
