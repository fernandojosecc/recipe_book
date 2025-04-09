<<<<<<< HEAD
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
=======
import 'package:flutter/widgets.dart';

class Recipe {
  int id;
  String name;
  String author;
  String image_link;
  List<String> recipeSteps;

  Recipe({
    required this.id,
    required this.name,
    required this.author,
    required this.image_link,
    required this.recipeSteps,
>>>>>>> parent of 640eabf (Fixing errors)
  });

  factory Recipe.fromJSON(Map<String, dynamic> json) {
    return Recipe(
<<<<<<< HEAD
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
=======
      id: json['id'],
      name: json['name'],
      author: json['author'],
      image_link: json['image_link'],
      recipeSteps: List<String>.from(json['recipe']),
>>>>>>> parent of 640eabf (Fixing errors)
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
<<<<<<< HEAD
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
=======
      'name': name,
      'author': author,
      'image_link': image_link,
      'recipe': recipeSteps,
    };
  }

  @override
  String toString() {
    return 'Recipe{id:$id,name: $name,author: $author,image_link: $image_link,recipe: $recipeSteps }';
  }
>>>>>>> parent of 640eabf (Fixing errors)
}
