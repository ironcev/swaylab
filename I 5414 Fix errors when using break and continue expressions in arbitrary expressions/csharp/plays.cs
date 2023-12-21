int return_int(int x)
{
    int value = x switch
    {
        0 => 1,
        1 => return 2, // error CS1525: Invalid expression term 'return'
        _ => 3,
    };
    
    return value;
}

// --------------------------------------------------------------

int return_int(int x)
{
    int value = x switch
    {
        0 => 1,
        1 => { // error CS1525: Invalid expression term '{'
            return 2;
            },
        _ => 3,
    };
    
    return value;
}

// --------------------------------------------------------------

int return_int(bool b)
{
    int value = b
        ? 0
        : return 1; // error CS1525: Invalid expression term 'return'
    
    return value;
}
