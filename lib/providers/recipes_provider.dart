import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/recipe_model.dart';

class RecipesProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Recipe> recipes = [];
  List<Recipe> favoriteRecipe = [];

  // On web we talk to localhost; on Android emulator use 10.0.2.2
  final String _host = kIsWeb ? 'localhost' : '10.0.2.2';
  final int _port = 12346;

  Uri get _recipesUri => Uri.http('$_host:$_port', '/recipes');
  Uri get _favoritesUri => Uri.http('$_host:$_port', '/favorites');

  Future<void> fetchRecipes() async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await http.get(_recipesUri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        recipes = List<Recipe>.from(
          data['recipes'].asMap().entries.map((e) {
            final json = e.value;
            return Recipe(
              id: e.key,
              name: json['name'],
              author: json['author'],
              imageLink: json['image_link'],
              recipeSteps: List<String>.from(json['recipe']),
            );
          }),
        );
      } else {
        debugPrint('Error ${response.statusCode}');
        recipes = [];
      }
    } catch (e) {
      debugPrint('Error fetching recipes: $e');
      recipes = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleFavoriteStatus(Recipe recipe) async {
    final isFavorite = favoriteRecipe.contains(recipe);
    try {
      final response =
          isFavorite
              ? await http.delete(
                _favoritesUri,
                body: json.encode({'id': recipe.id}),
              )
              : await http.post(
                _favoritesUri,
                body: json.encode(recipe.toJson()),
              );
      if (response.statusCode == 200) {
        if (isFavorite) {
          favoriteRecipe.remove(recipe);
        } else {
          favoriteRecipe.add(recipe);
        }
        notifyListeners();
      } else {
        throw Exception('Failed to update favorites (${response.statusCode})');
      }
    } catch (e) {
      debugPrint('Error updating favorite status: $e');
    }
  }
}
