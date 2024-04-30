#include <iostream>

int index(char* s, int i) {
    std::cout << s << std::endl;
    return i;
}

int inc_i(int& i) {
    i += 1;
    return i;
}

int main()
{
    int array[3] = { 0, 0, 0 };
    
    array[index("LHS", 0)] = index("RHS", 11);
    
    std::cout << array[0] << std::endl;
    
    std::cout << "-------------------------" << std::endl;
    
    int i = 0;
    array[inc_i(i)] = inc_i(i);
    std::cout << array[0] << std::endl;
    std::cout << array[1] << std::endl;
    std::cout << array[2] << std::endl;

    return 0;
}


// LHS
// RHS
// 11
// -------------------------
// 11
// 2
// 0
