import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book/providers/recipes_provider.dart';
<<<<<<< HEAD
=======
import 'package:recipe_book/screens/home_screen.dart';
import 'package:recipe_book/screens/favorites_recipes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
>>>>>>> parent of 640eabf (Fixing errors)

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
<<<<<<< HEAD
    return MaterialApp(
      title: 'Recipe Book',
      theme: ThemeData(primarySwatch: Colors.teal, useMaterial3: true),
      home: const HomePage(),
=======
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => RecipesProvider())],
      child: MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        debugShowCheckedModeBanner:
            false, //Is the strap at the corner that says DEBUG
        title: 'Hola Mundo',
        home: RecipeBook(),
      ),
>>>>>>> parent of 640eabf (Fixing errors)
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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
=======
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Recipe Book', style: TextStyle(color: Colors.white)),
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.pink,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.favorite), text: 'Favorite'),
              Tab(icon: Icon(Icons.exit_to_app), text: 'Exit'),
            ],
          ),
        ),
        body: TabBarView(children: [HomeScreen(), FavoritesRecipes()]),
>>>>>>> parent of 640eabf (Fixing errors)
      ),
    );
  }
}
