struct Inner {
    int a;
};

struct A {
    struct Inner inner;
    int a;
    int b;
};

void foo() {
    struct A a = {.inner = {.a = 5555}, .a = 1111, .b = 2222};
    struct Inner b = {.a = 6666};
    a.inner = b;
    a.a = 7777;
    a.b = 8888;
}

int main() {
    foo();
    return 0;
}