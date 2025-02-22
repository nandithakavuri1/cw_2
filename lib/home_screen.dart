import 'package:flutter/material.dart';
import 'details_screen.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> recipes = [
    {
      'name': 'Spaghetti Bolognese',
      'ingredients': 'Spaghetti, Ground Beef, Tomato Sauce, Onion, Garlic',
      'instructions': '1. Cook spaghetti. 2. Brown beef. 3. Add sauce and simmer. 4. Mix and serve.'
    },
    {
      'name': 'Chicken Curry',
      'ingredients': 'Chicken, Curry Powder, Coconut Milk, Onion, Garlic',
      'instructions': '1. Cook chicken. 2. Add spices. 3. Pour coconut milk. 4. Simmer and serve.'
    },
    {
      'name': 'Pancakes',
      'ingredients': 'Flour, Eggs, Milk, Sugar, Baking Powder',
      'instructions': '1. Mix ingredients. 2. Heat pan. 3. Pour batter. 4. Flip and serve.'
    },
  ];

  final Function(Map<String, String>) toggleFavorite;
  final List<Map<String, String>> favoriteRecipes;

  HomeScreen({required this.toggleFavorite, required this.favoriteRecipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Book'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.red),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FavoritesScreen(favoriteRecipes: favoriteRecipes),
                ),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index]['name']!),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    recipe: recipes[index],
                    toggleFavorite: toggleFavorite,
                    isFavorite: favoriteRecipes.contains(recipes[index]),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
