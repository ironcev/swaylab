script;

trait Trait {
    type AssociatedType;
}

struct Struct { }
struct GenStruct<T, const N: u8> { }

enum Enum {
    Variant1: (),
}

enum GenEnum<T, const N: u8> {
    Variant1: (),
}

impl Trait for Struct {
    type AssociatedType = u8;
}

type AliasGenStruct = GenStruct<Struct, 42>;

fn panicking_fn_bool(_x: bool) {
    panic;
}

fn panicking_fn_struct(_x: Struct) {
    panic;
}

fn panicking_fn_option(_x: Option<Struct>) {
    panic;
}

fn panicking_fn_unit(_x: ()) {
    panic;
}

fn panicking_fn_tuple(_x: (Option<Struct>, Struct, [u8; 2])) {
    panic;
}

fn panicking_fn_str_array(_x: str[5]) {
    panic;
}

fn panicking_fn_str(_x: str) {
    panic;
}

fn panicking_fn_enum(_x: Enum) {
    panic;
}

fn panicking_fn_gen_struct<T, const N: u8>(_x: GenStruct<T, N>) {
    panic;
}

fn panicking_fn_gen_enum<T, const N: u8>(_x: GenEnum<T, N>) {
    panic;
}

// fn panicking_fn_associated_type_over_trait<T>(_x: T::AssociatedType) where T: Trait {
//     panic;
// }
// ^^^^^^^^^^^^^^^^^ Internal compiler error: Self type not provided.

fn panicking_fn_associated_type_over_struct(_x: Struct::AssociatedType) {
    panic;
}

fn panicking_fn_alias(_x: AliasGenStruct) {
    panic;
}

fn main() {
    panicking_fn_bool(true);
    panicking_fn_struct(Struct {});
    panicking_fn_option(Some(Struct {}));
    panicking_fn_unit(());
    panicking_fn_tuple((Some(Struct {}), Struct {}, [1, 2]));
    panicking_fn_gen_struct(GenStruct::<u8, 2> {});
    panicking_fn_gen_struct(GenStruct::<Option<Struct>, 42> {});
    panicking_fn_str_array(__to_str_array("hello"));
    panicking_fn_str("hello");
    panicking_fn_enum(Enum::Variant1);
    panicking_fn_gen_enum(GenEnum::<u8, 2>::Variant1);
    // panicking_fn_associated_type_over_trait(Struct::AssociatedType::min());
    // ^^^^^^^^^^^^^^^^^ Internal compiler error: Self type not provided.
    // panicking_fn_associated_type_over_trait::<Struct>(0);
    // ^^^^^^^^^^^^^^^^^ Internal compiler error: Self type not provided.
    panicking_fn_associated_type_over_struct(0);
    panicking_fn_alias(AliasGenStruct {});
}
