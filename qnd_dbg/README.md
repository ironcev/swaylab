# Q&D DBG

Collection of functions useful for quick and dirty debugging.

Some additional code useful for debugging is given below.

# Tips & Tricks

1. Printing all IR optimisation passes

Add the following line to the _sway-core/src/lib.rs_ `compile_ast_to_ir_to_asm` function:

    let pass_group = sway_ir::insert_after_each(pass_group, MODULEPRINTER_NAME);
