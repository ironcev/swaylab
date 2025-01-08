void foo() {
    int x = 1111;
    int& p_x = x;
    p_x = 2222;
}

int main() {
    foo();
    return 0;
}