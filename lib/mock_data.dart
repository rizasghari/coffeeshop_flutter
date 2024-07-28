class Category {
  final String name;
  Category({required this.name});

  static List<Category> getSampleCategories() {
    return [
      Category(name: 'All Coffee'),
      Category(name: 'Machiato'),
      Category(name: 'Latte'),
      Category(name: 'Americano'),
      Category(name: 'Turkish Coffee'),
      Category(name: 'Cappuccino'),
      Category(name: 'Espresso'),
      Category(name: 'Cafe au Lait'),
    ];
  }
}