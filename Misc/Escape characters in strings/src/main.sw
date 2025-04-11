library;

#[test]
fn test_escape_characters_in_strings() {
    let quote = [34u8];
    let quote = asm(s: (__addr_of(quote), 1)) {
        s: str
    };

    assert_eq(quote, "\"");
}