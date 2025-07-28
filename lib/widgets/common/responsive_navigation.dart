// widgets/common/responsive_navigation.dart
import 'package:compile_recipile_book_app/screens/favorites_screen.dart';
import 'package:compile_recipile_book_app/screens/home_screen.dart';
import 'package:compile_recipile_book_app/screens/profile_screen.dart';
import 'package:compile_recipile_book_app/screens/recipe_list_screen.dart';
import 'package:compile_recipile_book_app/utils/responsive_breakpoints.dart';
import 'package:flutter/material.dart';

class ResponsiveNavigation extends StatefulWidget {
  const ResponsiveNavigation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ResponsiveNavigationState createState() => _ResponsiveNavigationState();
}

class _ResponsiveNavigationState extends State<ResponsiveNavigation> {
  int selectedIndex = 0;

  final List<AppDestination> destinations = [
    AppDestination(
      label: 'Home',
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
      page: HomeScreen(),
    ),
    AppDestination(
      label: 'Recipes',
      icon: Icons.restaurant_outlined,
      selectedIcon: Icons.restaurant,
      page: ViewAllRecipesScreen(),
    ),
    AppDestination(
      label: 'Favorites',
      icon: Icons.favorite_outline,
      selectedIcon: Icons.favorite,
      page: FavoritesScreen(),
    ),
    AppDestination(
      label: 'Profile',
      icon: Icons.person_outline,
      selectedIcon: Icons.person,
      page: ProfileScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.isDesktop(context)) {
      return _buildDesktopLayout();
    } else if (ResponsiveBreakpoints.isTablet(context)) {
      return _buildTabletLayout();
    } else {
      return _buildMobileLayout();
    }
  }

  Widget _buildDesktopLayout() {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            extended: true,
            selectedIndex: selectedIndex,
            onDestinationSelected: _onDestinationSelected,
            destinations: destinations.map(_buildRailDestination).toList(),
          ),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(child: destinations[selectedIndex].page),
        ],
      ),
    );
  }

  Widget _buildTabletLayout() {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: _onDestinationSelected,
            destinations: destinations.map(_buildRailDestination).toList(),
          ),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(child: destinations[selectedIndex].page),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      body: destinations[selectedIndex].page,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: _onDestinationSelected,
        destinations: destinations.map(_buildBottomDestination).toList(),
      ),
    );
  }

  NavigationRailDestination _buildRailDestination(AppDestination dest) {
    return NavigationRailDestination(
      icon: Icon(dest.icon),
      selectedIcon: Icon(dest.selectedIcon),
      label: Text(dest.label),
    );
  }

  NavigationDestination _buildBottomDestination(AppDestination dest) {
    return NavigationDestination(
      icon: Icon(dest.icon),
      selectedIcon: Icon(dest.selectedIcon),
      label: dest.label,
    );
  }

  void _onDestinationSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}

class AppDestination {
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final Widget page;

  const AppDestination({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.page,
  });
}
