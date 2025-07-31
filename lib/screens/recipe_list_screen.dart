import 'package:flutter/material.dart';
import 'package:compile_recipile_book_app/widgets/recipe/recipe_card.dart';
import 'recipe_detail_screen.dart';

class ViewAllRecipesScreen extends StatefulWidget {
  const ViewAllRecipesScreen({super.key});

  @override
  State<ViewAllRecipesScreen> createState() => _ViewAllRecipesScreenState();
}

class _ViewAllRecipesScreenState extends State<ViewAllRecipesScreen> {
  final List<Map<String, String>> recipes = [
    {
      'title': 'Avocado Toast',
      'cookTime': '10 min',
      'rating': '4.8',
      'thumbnailUrl':
          'https://media.istockphoto.com/id/971559940/photo/food.jpg?s=612x612&w=0&k=20&c=THBq556N843yRnCcrMR8O0FCZlDgUoqZsSPdTZUS6mo=',
    },
    {
      'title': 'Pasta Carbonara',
      'cookTime': '30 min',
      'rating': '4.6',
      'thumbnailUrl':
          'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',
    },
    {
      'title': 'Grilled Chicken',
      'cookTime': '25 min',
      'rating': '4.9',
      'thumbnailUrl':
          'https://plus.unsplash.com/premium_photo-1661419883163-bb4df1c10109?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8R3JpbGxlZCUyMENoaWNrZW58ZW58MHx8MHx8fDA%3D',
    },
    {
      'title': 'Chocolate Cake',
      'cookTime': '1 hr',
      'rating': '4.7',
      'thumbnailUrl':
          'https://images.unsplash.com/photo-1586985289906-406988974504?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Q2hvY29sYXRlJTIwQ2FrZXxlbnwwfHwwfHx8MA%3D%3D',
    },
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredRecipes = recipes.where((recipe) {
      final title = recipe['title']!.toLowerCase();
      final query = searchQuery.toLowerCase();
      return title.contains(query);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Recipes'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for food...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredRecipes.length,
              itemBuilder: (context, index) {
                final recipe = filteredRecipes[index];
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
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
          ),
        ],
      ),
    );
  }
}
