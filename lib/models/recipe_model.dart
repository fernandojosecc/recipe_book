class Recipe {
  final int id;
  final String title;
  final String description;
  final String imageUrl;

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  factory Recipe.fromJSON(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}
