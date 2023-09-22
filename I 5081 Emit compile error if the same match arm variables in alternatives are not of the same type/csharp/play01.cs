var c = new Class
{
    x = 1,
    y = 2,
    z = 3,
};

var p = c switch
{
   Class { x: var x, y:2, z: 3 } or Class { x: var x, y:2, z: 3 } => x,
   _ => 1111,
};

class Class
{
    public int x;
    public int y;
    public int z;
}

//    error CS8780: A variable may not be declared within a 'not' or 'or' pattern.
//    error CS8780: A variable may not be declared within a 'not' or 'or' pattern.
//    error CS0128: A local variable or function named 'x' is already defined in this scope
