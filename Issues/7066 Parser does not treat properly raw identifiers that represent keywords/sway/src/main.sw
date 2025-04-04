library;

fn raw_identifiers() {
   let r#not_a_keyword = true;
   if r#not_a_keyword { }
   while r#not_a_keyword { }

   let r#return = true;
   if r#return { }
   while r#return { }

   let r#if = true;
   if r#if { }
   while r#if { }
}
