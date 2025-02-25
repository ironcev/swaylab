fn fun() {
    /// Comment.
    #[allow(dead_code)]
    struct S {
        /// Comment.
        #[allow(dead_code)]
        field: u8,
    }

    /// Comment.
    #[allow(dead_code)]
    const CONST: u8 = 0;
}