struct Inner {
    int a;
};

struct A {
    struct Inner i;
    int b[4];
};

struct A foo() {
    struct Inner i = {.a = 199};
    struct A a = {.i = i, .b = {0}};
    struct A b = a;
    return a;
}

int bar(struct A a, int k) {
    return a.b[k];
}

int main() {
    return bar(foo(), 2);
}