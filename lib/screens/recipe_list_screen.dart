import 'package:compile_recipile_book_app/widgets/recipe/recipe_card.dart';
import 'package:flutter/material.dart';

import 'recipe_detail_screen.dart'; // Import Detail Screen

class ViewAllRecipesScreen extends StatelessWidget {
  ViewAllRecipesScreen({super.key});

  final List<Map<String, String>> recipes = [
    {
      'title': 'Avocado Toast',
      'cookTime': '10 min',
      'rating': '4.8',
      'thumbnailUrl': 'https://images.unsplash.com/photo-1568605114967-8130f3a36994',
    },
    {
      'title': 'Pasta Carbonara',
      'cookTime': '30 min',
      'rating': '4.6',
      'thumbnailUrl': 'https://images.unsplash.com/photo-1523986371872-9d3ba2e2f5ad',
    },
    {
      'title': 'Grilled Chicken',
      'cookTime': '25 min',
      'rating': '4.9',
      'thumbnailUrl': 'https://images.unsplash.com/photo-1604908177522-63e1f3c92b08',
    },
    {
      'title': 'Chocolate Cake',
      'cookTime': '1 hr',
      'rating': '4.7',
      'thumbnailUrl': 'https://images.unsplash.com/photo-1606851093004-4e8d5e2d8859',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Recipes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailScreen(
                    title: recipe['title']!,
                    cookTime: recipe['cookTime']!,
                    rating: recipe['rating']!,
                    thumbnailUrl: recipe['thumbnailUrl']!,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: RecipeCard(
                title: recipe['title']!,
                cookTime: recipe['cookTime']!,
                rating: recipe['rating']!,
                thumbnailUrl: recipe['thumbnailUrl']!,
              ),
            ),
          );
        },
      ),
    );
  }
}
