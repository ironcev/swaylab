int main() {
    int a = 5;
    int b = 3;
    int result;

    asm("addl %%ebx, %%eax;"
        : "=a"(result)
        : "a"(a), "b"(b));

    // asm(); // ERROR: error: expected string literal in 'asm'

    asm("");

    return 0;
}
