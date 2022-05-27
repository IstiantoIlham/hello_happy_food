class FoodCategory {
  FoodCategory({
    required this.category,
    required this.key,
  });
  String category;
  String key;

  factory FoodCategory.fromJson(Map<String, dynamic> json) =>
      FoodCategory(category: json['category'], key: json['key']);

  static fromJSON(json) {}
}