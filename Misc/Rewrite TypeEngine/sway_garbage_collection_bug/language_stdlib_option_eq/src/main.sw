script;

pub type StringArray = str[4];
impl core::ops::Eq for StringArray {
    fn eq(self, other: Self) -> bool {
        from_str_array(self) == from_str_array(other)
    }
}

fn main() -> bool {
    // Test with string array
    let string1: StringArray = __to_str_array("fuel");
    let string2: StringArray = __to_str_array("sway");

    let string_option1 = Option::Some(string1);
    let string_option2 = Option::Some(string1);
    let string_option3 = Option::Some(string2);
    let string_none_option: Option<StringArray> = Option::None;

    // Eq tests
    assert(string_option1 == string_option1);
    assert(string_option1 == string_option2);

    // Neq tests
    assert(string_option1 != string_option3);
    assert(string_option1 != string_none_option);

    // None tests
    assert(string_none_option == Option::None);
    assert(Option::<StringArray>::None == string_none_option);

    true
}
