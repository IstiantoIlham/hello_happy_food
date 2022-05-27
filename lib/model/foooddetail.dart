class Results {
  Results({
    required this.title,
    required this.thumb,
    required this.ingredient,
    required this.step,
  });

  String title;
  String thumb;
  List<String> ingredient;
  List<String> step;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        title: json["title"] ?? 'null',
        thumb: json["thumb"] ??
            'https://images.unsplash.com/photo-1499233983070-99a5f004e720?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZmlyZXdvcmt8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
        ingredient: List<String>.from(json["ingredient"].map((x) => x)),
        step: List<String>.from(json["step"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "thumb": thumb,
        "ingredient": List<dynamic>.from(ingredient.map((x) => x)),
        "step": List<dynamic>.from(step.map((x) => x)),
      };
}
