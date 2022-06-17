class Category {
  final String title;

  Category(this.title);
}

List<Category> getAllCategories() {
  return [
    Category('Technology'),
    Category('Business'),
    Category('Sports'),
  ];
}
