use crate::structure::*;

trait Matcher<T> { }

trait MatchStorageFields: Matcher<StorageField> {
    fn match_storage_fields<P>(&self, predicate: P) -> impl Iterator<Item=&StorageField>
    where P: Fn(&&StorageField) -> bool + Clone;
}

impl Matcher<StorageField> for Storage { }

impl MatchStorageFields for Storage {
    fn match_storage_fields<P>(&self, predicate: P) -> impl Iterator<Item=&StorageField>
    where P: Fn(&&StorageField) -> bool + Clone
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

impl Matcher<StorageField> for StorageNamespace { }

impl MatchStorageFields for StorageNamespace {
    fn match_storage_fields<P>(&self, predicate: P) -> impl Iterator<Item=&StorageField>
    where P: Fn(&&StorageField) -> bool + Clone
    {
        self
            .fields
            .iter()
            .filter(predicate)
    }
}

fn storage_fields<M, P>(scope: &M, predicate: P) -> impl Iterator<Item=&StorageField>
where
    P: Fn(&&StorageField) -> bool + Clone,
    M: MatchStorageFields,
{
    scope.match_storage_fields(predicate)
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
}

fn with_in_keyword(sf: &&StorageField) -> bool {
    sf.has_in_keyword
}

fn any<T>(_t: &&T) -> bool {
    true
}
