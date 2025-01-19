use crate::structure::*;

trait Matcher<T> {
    fn find<'a, P>(&'a self, predicate: P) -> impl Iterator<Item=&'a T>
    where
        P: Fn(&&'a T) -> bool + Clone + 'a,
        T: 'a;
}

impl Matcher<StorageField> for Storage {
    fn find<'a, P>(&'a self, predicate: P) -> impl Iterator<Item=&'a StorageField>
    where
        P: Fn(&&'a StorageField) -> bool + Clone + 'a,
    {
        self
            .fields
            .iter()
            .filter(predicate.clone())
            .chain(
                self
                    .namespaces
                    .iter()
                    .flat_map(|ns| &ns.fields)
                    .filter(predicate)
            )
    }
}

impl Matcher<StorageField> for StorageNamespace {
    fn find<'a, P>(&'a self, predicate: P) -> impl Iterator<Item=&'a StorageField>
    where
        P: Fn(&&'a StorageField) -> bool + Clone + 'a,
    {
        self
            .fields
            .iter()
            .filter(predicate)
    }
}

fn storage_fields<'a, S, P>(scope: &'a S, predicate: P) -> impl Iterator<Item=&'a StorageField>
where
    P: Fn(&&StorageField) -> bool + Clone + 'a,
    S: Matcher<StorageField>,
{
    scope.find(predicate)
}

macro_rules! all_of {
    ($($i:expr),*) => {
       all_of([$($i, )*].as_slice())
    };
}

pub fn play() {
    let storage = Storage::sample();

    println!("In the whole storage");

    let mut fields = storage_fields(&storage, |sf| sf.has_in_keyword);
    print_storage_fields("Has in keyword", &mut fields);
    let mut fields = storage_fields(&storage, with_in_keyword);
    print_storage_fields("With in keyword", &mut fields);
    let mut fields = storage_fields(&storage, with_in_keyword);
    print_storage_fields("With in keyword", &mut fields);
    let mut fields = storage_fields(&storage, any);
    print_storage_fields("Any", &mut fields);
    let mut fields = storage_fields(&storage, any);
    print_storage_fields("Any", &mut fields);
    let should_have_in_keyword = true;
    let mut fields = storage_fields(&storage, |sf| sf.has_in_keyword == should_have_in_keyword);
    print_storage_fields("Should have in keyword", &mut fields);

    println!("In the first namespace");

    let mut fields = storage_fields(&storage.namespaces[0], |sf| sf.has_in_keyword);
    print_storage_fields("Has in keyword", &mut fields);
    let mut fields = storage_fields(&storage.namespaces[0], with_in_keyword);
    print_storage_fields("With in keyword", &mut fields);
    let mut fields = storage_fields(&storage.namespaces[0], with_in_keyword);
    print_storage_fields("With in keyword", &mut fields);
    let mut fields = storage_fields(&storage.namespaces[0], any);
    print_storage_fields("Any", &mut fields);
    let mut fields = storage_fields(&storage.namespaces[0], any);
    print_storage_fields("Any", &mut fields);
    let should_have_in_keyword = true;
    let mut fields = storage_fields(&storage.namespaces[0], |sf| sf.has_in_keyword == should_have_in_keyword);
    print_storage_fields("Should have in keyword", &mut fields);
    let mut fields = storage_fields(&storage.namespaces[0], all_of([with_in_keyword, with_name_containing_1].as_slice()));
    print_storage_fields("All of with function call: with_name_containing_1", &mut fields);
    let mut fields = storage_fields(&storage.namespaces[0], all_of!(with_in_keyword, with_name_containing_1));
    print_storage_fields("All of with macro call: with_name_containing_1", &mut fields);
    let mut fields = storage_fields(&storage.namespaces[0], all_of([with_in_keyword, with_name_containing_keyword].as_slice()));
    print_storage_fields("All of with function call: with_name_containing_keyword", &mut fields);
    let mut fields = storage_fields(&storage.namespaces[0], all_of!(self::with_in_keyword, with_name_containing_keyword));
    print_storage_fields("All of with macro call: with_name_containing_keyword", &mut fields);
    // let mut fields = storage_fields(&storage.namespaces[0], all_of!(|sf: &&StorageField| sf.has_in_keyword, |sf: &&StorageField| sf.has_in_keyword == should_have_in_keyword));
    // print_storage_fields("All of with macro call: with_name_containing_keyword", &mut fields);
}

fn with_in_keyword(sf: &&StorageField) -> bool {
    sf.has_in_keyword
}

fn any<T>(_t: &&T) -> bool {
    true
}

fn with_name_containing_1(sf: &&StorageField) -> bool {
    sf.name.contains("1")
}

fn with_name_containing_keyword(sf: &&StorageField) -> bool {
    sf.name.contains("keyword")
}

fn all_of<T, P>(predicates: &[P]) -> impl Fn(&&T) -> bool + Clone + '_
where P: Fn(&&T) -> bool + Clone,
{
    move |t: &&T| {
        let mut res = true;
        for predicate in predicates {
            res &= predicate(t);
        }
        res
    }
}