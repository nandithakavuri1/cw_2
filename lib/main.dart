import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'favorites_screen.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatefulWidget {
  @override
  _RecipeAppState createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  List<Map<String, String>> favoriteRecipes = [];

  void toggleFavorite(Map<String, String> recipe) {
    setState(() {
      if (favoriteRecipes.contains(recipe)) {
        favoriteRecipes.remove(recipe);
      } else {
        favoriteRecipes.add(recipe);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Book',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: HomeScreen(
        toggleFavorite: toggleFavorite,
        favoriteRecipes: favoriteRecipes,
      ),
    );
  }
}
