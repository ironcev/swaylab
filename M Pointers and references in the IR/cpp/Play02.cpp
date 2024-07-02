struct Inner {
    int a;
};

struct A {
    struct Inner i;
    int b[4];
};

void foo() {
    struct Inner i = {.a = 112233 };
    struct A a = {.i = i, .b = {0}};
    struct A b = a;
    struct A c = a;
    c = b;
}

int main() {
    foo();
    return 0;
}