pub mod top_level_module {
    pub mod pub_submodule {
        use super::priv_submodule;

        pub fn fun() { }

        pub fn fun_use_priv_submodule() {
            priv_submodule::fun();
        }

        pub mod nested_pub_submodule {
            pub fn fun() { }
        }

        mod nested_priv_submodule {
            pub fn fun() { }
        }
    }

    mod priv_submodule {
        pub fn fun() { }

        pub mod priv_submodule_pub_submodule {
            pub fn fun() { }
        }

        mod priv_submodule_priv_submodule {
            pub fn fun() { }
        }
    }

    fn fun() {
        pub_submodule::nested_pub_submodule::fun();
        // pub_submodule::nested_priv_submodule::fun();
        //                ^^^^^^^^^^^^^^^^^^^^^  --- function `fun` is not publicly re-exported
        //                  |
        //                  private module
    }
}

fn main() {
    top_level_module::pub_submodule::fun();
    // top_level_module::priv_submodule::priv_submodule_pub_submodule::fun();
    //                   ^^^^^^^^^^^^^^ private module                 --- function `fun` is not publicly re-exported
}
