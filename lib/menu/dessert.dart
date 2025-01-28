class FoodCategory {
  final String name;
  final String description;
  final String imageUrl;
  final int price;
  final int originalPrice;
  final int discount;
  bool isFavourite;

  FoodCategory({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.originalPrice,
    required this.discount,
    this.isFavourite = false,
  });
}
