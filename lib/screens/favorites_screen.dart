import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> favoriteRecipes = [
      {
        'title': 'Egusi Soup',
        'image':
            'https://media.istockphoto.com/id/498310978/photo/egusi-soup-and-pounded-yam-nigerian-cuisine.webp?a=1&b=1&s=612x612&w=0&k=20&c=8RYkql2CrZ6ybqCK6aomthImUbcvmLJhq8lxtKI2uL0=',
      },
      {
        'title': 'Burger',
        'image':
            'https://images.unsplash.com/photo-1572802419224-296b0aeee0d9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YnVyZ2VyfGVufDB8fDB8fHww',
      },
      {
        'title': 'Jollof Rice',
        'image':
            'https://plus.unsplash.com/premium_photo-1694141252026-3df1de888a21?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8am9sbG9mJTIwcmljZXxlbnwwfHwwfHx8MA%3D%3D',
      },
      {
        'title': 'Fried Rice',
        'image':
            'https://media.istockphoto.com/id/2160386467/photo/photo-of-crab-fried-rice-on-a-plate-in-a-seafood-restaurant-while-traveling-in-phuket-thailand.webp?a=1&b=1&s=612x612&w=0&k=20&c=EkfdjWykSxbVdflF2OQYTB3xekPnVpwSosnwt_gQ4V4=',
      },
      {
        'title': 'Chicken Suya',
        'image':
            'https://media.istockphoto.com/id/1212447634/photo/nigerian-suya-chicken-roast-potatoes-and-butternut-squash-with-jollof.webp?a=1&b=1&s=612x612&w=0&k=20&c=adxvf5fX_5YQxAi-9RoKUcKTsi5v1mL1Wj5qzddCt_U=',
      },
      {
        'title': 'Pounded Yam & Efo Riro',
        'image':
            'https://media.istockphoto.com/id/2175971940/photo/african-vegetable-soup-with-assorted-meat-and-pounded-yam.jpg?s=1024x1024&w=is&k=20&c=VNg1EJhbyxQhjxLo-JWvKmH3ZmMsOYa0x7UTcRFdCog=',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Recipes'),
      ),
      body: ListView.builder(
        itemCount: favoriteRecipes.length,
        itemBuilder: (context, index) {
          final recipe = favoriteRecipes[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(
                recipe['image']!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(recipe['title']!),
            ),
          );
        },
      ),
    );
  }
}
