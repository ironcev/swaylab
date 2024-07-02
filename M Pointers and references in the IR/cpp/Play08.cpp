struct Inner {
    long i;
};

struct A {
    struct Inner inner;
    long a;
    long b;
    int array[3];
};

void by_val(struct A a) {
    a.a = 1111;
    a.b = 2222;
}

void by_ref(struct A& a) {
    a.a = 1111;
    a.b = 2222;
}

void by_ptr(struct A* a) {
    a->a = 1111;
    a->b = 2222;
}

struct A ret_val() {
    struct A a = {.inner = { .i = 1111 }, .a = 3333, .b = 4444, .array = { 0 }};
    a.a = 1111;
    a.b = 2222;
    return a;
}

int main() {
    struct A a = {.inner = { .i = 1111 }, .a = 3333, .b = 4444, .array = { 0 }};
    by_val(a);
    by_ref(a);
    by_ptr(&a);
    struct A b = ret_val();
    return 0;
}