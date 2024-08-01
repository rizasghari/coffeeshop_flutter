import 'package:coffee_shop_flutter/enums.dart';

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

class ItemFeature {
  final String name;
  final String image;

  ItemFeature({
    required this.name,
    required this.image,
  });

  static List<ItemFeature> getSampleItemFeatures() {
    return [
      ItemFeature(name: "Fast Delivery", image: "assets/images/delivery.png"),
      ItemFeature(name: "Quality Bean", image: "assets/images/bean.png"),
      ItemFeature(name: "Extra Milk", image: "assets/images/milk.png"),
    ];
  }
}

const List<(CoffeeSize, String)> coffeeSizes = [
  (CoffeeSize.small, "S"),
  (CoffeeSize.medium, "M"),
  (CoffeeSize.large, "L"),
];
