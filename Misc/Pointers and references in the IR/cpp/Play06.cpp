struct A {
    int a;
    int b;
};

void foo() {
    struct A a = {.a = 1111, .b = 2222};
    struct A* p_a = &a;
    p_a->a = 3333;
}

int main() {
    foo();
    return 0;
}