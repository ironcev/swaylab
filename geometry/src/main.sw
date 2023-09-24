script;

mod geometry;

use geometry::Rect;

fn main() -> u64 {
   let rect = Rect::new(12, 12);

   rect.area()
}
