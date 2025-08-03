import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatefulWidget {
  final String title;
  final String cookTime;
  final String rating;
  final String thumbnailUrl;

  const RecipeDetailScreen({
    super.key,
    required this.title,
    required this.cookTime,
    required this.rating,
    required this.thumbnailUrl,
  });

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  int likeCount = 0;
  int loveCount = 0;
  bool isLiked = false;
  bool isLoved = false;

  String getDescriptionFromUrl(String url) {
    if (url.contains('avocado')) {
      return 'Enjoy a healthy and delicious Avocado Toast, perfect for a quick breakfast or snack. Topped with fresh avocados and a hint of seasoning.';
    } else if (url.contains('pasta')) {
      return 'Indulge in creamy Pasta Carbonara, a classic Italian dish made with eggs, cheese, pancetta, and pepper.';
    } else if (url.contains('grilled')) {
      return 'Savor this juicy Grilled Chicken, seasoned to perfection and grilled to give it a smoky flavor.';
    } else if (url.contains('chocolate')) {
      return 'Treat yourself to a rich and moist Chocolate Cake, layered with decadent chocolate frosting.';
    } else if (url.contains('egusi')) {
      return 'Egusi Soup is a Nigerian delicacy made with melon seeds, vegetables, and assorted meats. Best served with pounded yam.';
    } else if (url.contains('burger')) {
      return 'This juicy Burger is loaded with fresh vegetables, cheese, and a perfectly grilled beef patty.';
    } else {
      return 'This is a delicious recipe that’s easy to prepare and perfect for any occasion. Try it and enjoy a mouthwatering experience!';
    }
  }

  void toggleLike() {
    setState(() {
      if (isLiked) {
        likeCount--;
      } else {
        likeCount++;
      }
      isLiked = !isLiked;
    });
  }

  void toggleLove() {
    setState(() {
      if (isLoved) {
        loveCount--;
      } else {
        loveCount++;
      }
      isLoved = !isLoved;
    });
  }

  @override
  Widget build(BuildContext context) {
    final description = getDescriptionFromUrl(widget.thumbnailUrl);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.thumbnailUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow),
                  const SizedBox(width: 5),
                  Text(
                    widget.rating,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 20),
                  const Icon(Icons.schedule, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(
                    widget.cookTime,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Description',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Text(
                description,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: toggleLike,
                    icon: Icon(
                      Icons.thumb_up,
                      color: isLiked ? Colors.blue : Colors.grey,
                    ),
                  ),
                  Text('$likeCount'),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: toggleLove,
                    icon: Icon(
                      Icons.favorite,
                      color: isLoved ? Colors.red : Colors.grey,
                    ),
                  ),
                  Text('$loveCount'),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
