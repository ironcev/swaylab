library;

pub mod lib01;
pub mod lib02;

pub fn use_me() {
    ::lib01::use_me();
    ::lib01::lib01_nested::use_me();
    ::lib02::use_me();
    ::lib02::lib02_nested::use_me();
}