struct Inner {
    long i;
};

struct A {
    struct Inner inner;
    long a;
    long b;
    int array[3];
};

void foo(struct A a, struct A& r_a) {
    a.a = 1111;
    a.b = 2222;
    r_a.a = 3333;
}

int main() {
    struct A a = {.inner = { .i = 1111 }, .a = 3333, .b = 4444, .array = { 0 }};
    foo(a, a);
    return 0;
}