using System;

int[] array = [0, 0, 0];

array[index("LHS", 0)] = index("RHS", 11);

Console.WriteLine(array[0]);

Console.WriteLine("-------------------------");

int i = 0;
array[incI(ref i)] = incI(ref i);
Console.WriteLine(array[0]);
Console.WriteLine(array[1]);
Console.WriteLine(array[2]);

int index(string s, int i)
{
    Console.WriteLine(s);  
    return i;
}

int incI(ref int i) {
    i += 1;
    return i;
}


// LHS
// RHS
// 11
// -------------------------
// 11
// 2
// 0
