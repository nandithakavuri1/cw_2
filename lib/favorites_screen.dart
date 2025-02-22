import 'package:flutter/material.dart';
import 'details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, String>> favoriteRecipes;

  FavoritesScreen({required this.favoriteRecipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorite Recipes')),
      body: favoriteRecipes.isEmpty
          ? Center(child: Text('No favorite recipes yet!'))
          : ListView.builder(
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(favoriteRecipes[index]['name']!),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          recipe: favoriteRecipes[index],
                          toggleFavorite: (recipe) {}, // No need to change state here
                          isFavorite: true,
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
