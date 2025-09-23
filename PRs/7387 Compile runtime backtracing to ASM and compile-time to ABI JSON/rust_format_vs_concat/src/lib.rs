/// Concatenate two strings using format! macro
pub fn format_concat(a: &str, b: &str) -> String {
    format!("{}{}", a, b)
}

/// Concatenate two strings using slice concat method
pub fn slice_concat(a: &str, b: &str) -> String {
    [a, b].concat()
}

/// Concatenate multiple strings using format! macro
pub fn format_concat_multiple(strings: &[&str]) -> String {
    match strings.len() {
        2 => format!("{}{}", strings[0], strings[1]),
        3 => format!("{}{}{}", strings[0], strings[1], strings[2]),
        4 => format!("{}{}{}{}", strings[0], strings[1], strings[2], strings[3]),
        _ => strings.iter().map(|s| *s).collect::<String>(),
    }
}

/// Concatenate multiple strings using slice concat method
pub fn slice_concat_multiple(strings: &[&str]) -> String {
    strings.concat()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_format_concat() {
        assert_eq!(format_concat("hello", "world"), "helloworld");
    }

    #[test]
    fn test_slice_concat() {
        assert_eq!(slice_concat("hello", "world"), "helloworld");
    }

    #[test]
    fn test_format_concat_multiple() {
        assert_eq!(format_concat_multiple(&["a", "b", "c"]), "abc");
    }

    #[test]
    fn test_slice_concat_multiple() {
        assert_eq!(slice_concat_multiple(&["a", "b", "c"]), "abc");
    }

    #[test]
    fn test_both_methods_produce_same_result() {
        let a = "The quick brown fox";
        let b = " jumps over the lazy dog";
        
        assert_eq!(format_concat(a, b), slice_concat(a, b));
        
        let strings = &[a, b, "!"];
        assert_eq!(format_concat_multiple(strings), slice_concat_multiple(strings));
    }
}
