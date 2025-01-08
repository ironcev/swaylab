struct A {
    int a;
    int b;
};

void foo() {
    struct A a = {.a = 1111, .b = 2222};
    struct A b = a;
    a = b;

    int x = 3333;
    int y = 4444;
    y = x;
}

int main() {
    foo();
    return 0;
}