library;

#[inline(never)]
pub fn play() {
    let i = 0;
    let mut array = [1, 2, 3];

    let r_array = &array;
    let m_r_array = &mut array;

    *r_array = [2, 3, 4];
    *m_r_array = [2, 3, 4];

    *&array = [2, 3, 4];
    *&mut array = [2, 3, 4];

    *i = 0;
    *array = 0;
}