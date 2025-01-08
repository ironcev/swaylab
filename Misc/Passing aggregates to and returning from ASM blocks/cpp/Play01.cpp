#include <iostream>
#include <cstdint>

struct MyStruct {
    uint64_t field1;
    uint64_t field2;
};

void increment_fields_on_ptr(MyStruct* s) {
    __asm__ __volatile__ (
        "addq $100, (%0)\n\t"
        "addq $100, 8(%0)\n\t"
        : // no output
        : "r" (s)
        : "memory"
    );
}

void increment_fields_on_val(MyStruct s) {
    __asm__ __volatile__ (
        "addq $100, (%0)\n\t"
        "addq $100, 8(%0)\n\t"
        : // no output
        : "r" (s)
        : "memory"
    );
// <source>:21:9: error: Don't know how to handle indirect register inputs yet for constraint 'r'
//    21 |         "addq $100, (%0)\n\t"
//       |         ^
}

int main() {
    MyStruct my_struct = {10, 20};

    increment_fields_on_ptr(&my_struct);

    std::cout << "field1: " << my_struct.field1 << std::endl; // 110
    std::cout << "field2: " << my_struct.field2 << std::endl; // 120

    increment_fields_on_val(my_struct);

    return 0;
}

