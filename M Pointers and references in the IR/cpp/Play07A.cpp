struct A {
    long a;
    long b;
};

void foo(struct A a, struct A& r_a) {
    a.a = 1111;
    a.b = 2222;
    r_a.a = 3333;
}

int main() {
    struct A a = { .a = 3333, .b = 4444 };
    foo(a, a);
    return 0;
}