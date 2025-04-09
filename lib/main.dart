import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book/providers/recipes_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => RecipesProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Book',
      theme: ThemeData(primarySwatch: Colors.teal, useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecipesProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Recipe Book')),
      body:
          provider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: provider.recipes.length,
                itemBuilder: (context, index) {
                  final recipe = provider.recipes[index];
                  return ListTile(
                    leading: Image.network(recipe.imageUrl),
                    title: Text(recipe.title),
                    subtitle: Text(recipe.description),
                    trailing: IconButton(
                      icon: Icon(
                        provider.favoriteRecipe.contains(recipe)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () => provider.toggleFavoriteStatus(recipe),
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.fetchRecipes();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
