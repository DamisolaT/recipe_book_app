// screens/home_screen.dart

import 'package:compile_recipile_book_app/screens/recipe_list_screen.dart';
import 'package:compile_recipile_book_app/utils/responsive_breakpoints.dart';
import 'package:compile_recipile_book_app/widgets/recipe/recipe_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroSection(context),
            SizedBox(height: 32),
            _buildFeaturedRecipes(context),
            SizedBox(height: 32),
            //   _buildQuickCategories(context),
            SizedBox(height: 32),
            //  _buildRecentlyViewed(context),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Recipe Book'),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () => _showSearch(context),
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart_outlined),
          onPressed: () => _navigateToShoppingList(context),
        ),
      ],
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
       height: ResponsiveBreakpoints.isMobile(context) ? 200 : 300,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.orange[400]!, Colors.deepOrange[600]!],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Text(
                'Welcome to Recipe Book',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            FittedBox(
              child: Text(
                'Discover amazing recipes for every occasion',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _exploreRecipes(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.orange[600],
              ),
              child: Text('Explore Recipes'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedRecipes(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Featured Recipes',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () => _viewAllRecipes(context),
              child: Text('View All'),
            ),
          ],
        ),
        SizedBox(height: 16),
        // ResponsiveRecipeGrid(
        //   recipes: SampleData.featuredRecipes,
        //   maxItems: ResponsiveBreakpoints.isMobile(context) ? 4 : 6,
        // ),
        RecipeCard(
          title: 'My Recipe',
          cookTime: '4.9',
          rating: '30 min',
          thumbnailUrl:
              'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',
        ),
         RecipeCard(
          title: 'My Recipe',
          cookTime: '4.9',
          rating: '30 min',
          thumbnailUrl:
              'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',
        ),
        RecipeCard(
          title: 'My Recipe',
          cookTime: '4.9',
          rating: '30 min',
          thumbnailUrl:
              'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',
        ),
         RecipeCard(
          title: 'My Recipe',
          cookTime: '4.9',
          rating: '30 min',
          thumbnailUrl:
              'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',
        ),
         RecipeCard(
          title: 'My Recipe',
          cookTime: '4.9',
          rating: '30 min',
          thumbnailUrl:
              'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',
        ),
      ],
    );
  }

  // Helper methods
  void _showSearch(BuildContext context) {
    // Implement search functionality
  }

  void _navigateToShoppingList(BuildContext context) {
    // Navigate to shopping list
  }

  void _exploreRecipes(BuildContext context) {
    // Navigate to recipe list
  }

  void _viewAllRecipes(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ViewAllRecipesScreen(),
    ),
  );
}

}
