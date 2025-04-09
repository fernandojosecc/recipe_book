import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_book/models/recipe_model.dart';

class RecipesProvider extends ChangeNotifier {
  int _currentPageIndex = 0;

  int get currentPageIndex => _currentPageIndex;

  void updatePageIndex(int index) {
    if (index != _currentPageIndex) {
      _currentPageIndex = index;
      notifyListeners();
    }
  }

  bool isLoading = false;
  List<Recipe> recipes = [];
  List<Recipe> favoriteRecipe = [];

  Future<void> fetchRecipes() async {
    isLoading = true;
    notifyListeners();
<<<<<<< HEAD

=======
    //10.0.0.2.2 for mobile
>>>>>>> parent of 640eabf (Fixing errors)
    final url = Uri.parse('http://localhost:12346/recipes');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        recipes = List<Recipe>.from(
          data['recipes'].map((recipe) => Recipe.fromJSON(recipe)),
        );
      } else {
        print('Error ${response.statusCode}');
        recipes = [];
      }
    } catch (e) {
      print('Error in request: $e');
      recipes = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleFavoriteStatus(Recipe recipe) async {
    final isFavorite = favoriteRecipe.contains(recipe);
    final url = Uri.parse('http://localhost:12346/recipes');
    try {
<<<<<<< HEAD
=======
      final url = Uri.parse('http://localhost:12346/favorites');
>>>>>>> parent of 640eabf (Fixing errors)
      final response =
          isFavorite
              ? await http.delete(url, body: json.encode({"id": recipe.id}))
              : await http.post(url, body: json.encode(recipe.toJson()));
      if (response.statusCode == 200) {
        if (isFavorite) {
          favoriteRecipe.remove(recipe);
        } else {
          favoriteRecipe.add(recipe);
        }
        notifyListeners();
      } else {
        throw Exception('Failed to update favorite recipes');
      }
    } catch (e) {
      print('Error updating favorite status $e :/');
    }
  }

  Future<void> addRecipe(Recipe recipe) async {
    final url = Uri.parse('http://localhost:12346/recipes');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(recipe.toJson()),
      );

      if (response.statusCode == 200) {
        recipes.add(recipe);
        notifyListeners();
      } else {
        throw Exception('Failed to add recipe');
      }
    } catch (e) {
      print('Error adding recipe: $e');
    }
  }
}
