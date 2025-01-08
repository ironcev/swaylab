contract;

abi ConstSample {
    const ABI_CONST_WITH_VALUE = 123;
    
    const ABI_CONST_WITH_TYPE_AND_VALUE: u8 = 111;
    
    const ABI_CONST_WITH_TYPE_ONLY: u8;
    
    //const ABI_CONST_NAKED;
    // ERROR: Constant requires type ascription.
    
    fn test() -> u64;
} {
    //const ABI_IMPL_CONST = 123;
    // ERROR: Expected 'fn'.
    
    fn implemented() {}
}

impl ConstSample for Contract {
    // ERROR: (If constants are not implemented.)
    // Constants are missing from this trait implementation: ABI_CONST_WITH_TYPE_AND_VALUE ABI_CONST_WITH_TYPE_ONLY
    
    //const CONST = 123;
    // ERROR: Constant "CONST" is not a part of ABI "ConstSample"'s interface surface.
    
    //const ABI_CONST_WITH_VALUE = 123;
    // ERROR:
    // expected: numeric 
    // found:    numeric 
    // help:     The definition of this constant must match the one in the ABI "ConstSample" declaration.
    
    const ABI_CONST_WITH_TYPE_AND_VALUE: u8 = 222; // OK.
    
    //const ABI_CONST_WITH_TYPE_AND_VALUE;
    // ERROR: Constant requires expression.
    
    //const ABI_CONST_WITH_TYPE_ONLY: u8;
    // ERROR: Constant requires expression.
    
    const ABI_CONST_WITH_TYPE_ONLY: u8 = 222;
    
    //const ABI_CONST_WITH_TYPE_ONLY: u64 = 222;
    // ERROR:
    // expected: u8 
    // found:    u64 
    // help:     The definition of this constant must match the one in the ABI "ConstSample" declaration.

    fn test() -> u64 {
        0
    }
}