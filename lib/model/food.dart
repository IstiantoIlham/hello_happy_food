class Food {
  Food({
    required this.thumb,
    required this.key,
  });
  String thumb;
  String key;

  factory Food.fromJson(Map<String, dynamic> json) =>
      Food(thumb: json['thumb'], key: json['key']);

  static fromJSON(json) {}
}
