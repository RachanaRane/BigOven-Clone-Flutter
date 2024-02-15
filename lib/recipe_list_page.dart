import 'package:my_first_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/recripe_library.dart';
import 'profile_page.dart';

class Recipe {
  final String name;
  final String imageUrl;
  final String blogContent;

  Recipe({
    required this.name,
    required this.imageUrl,
    required this.blogContent,
  });
}

class MyApp extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe(
      name: 'Chocolate Cake',
      imageUrl:
          'https://scientificallysweet.com/wp-content/uploads/2020/09/IMG_4087-feature-2.jpg',
      blogContent: 'This is a delicious chocolate cake recipe...',
    ),
    Recipe(
      name: 'poha',
      imageUrl:
          'https://c2.staticflickr.com/2/1703/25173602171_2a9465cd12_z.jpg',
      blogContent: 'Enjoy this flavorful poha recipe...',
    ),
    Recipe(
      name: 'pulaw',
      imageUrl:
          'https://www.indianhealthyrecipes.com/wp-content/uploads/2022/04/veg-pulao-recipe.jpg',
      blogContent: 'Enjoy this flavorful pulaw recipe...',
    ),
    // Add more recipes as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      home: RecipeListPage(recipes: recipes),
    );
  }
}

class RecipeListPage extends StatelessWidget {
  final List<Recipe> recipes;

  RecipeListPage({required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editorials'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  recipes[index].imageUrl,
                  fit: BoxFit.cover,
                  height: 200.0, // Adjust the height as needed
                ),
                ListTile(
                  title: Text(recipes[index].name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RecipeDetailPage(recipe: recipes[index]),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'My Recipes',
          ),
        ],
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideoPlayerApp(),
              ),
            );
          }
           if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Recipelib(),
              ),
            );
          }
        },
      ),
    );
  }
}

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailPage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              recipe.imageUrl,
              fit: BoxFit.cover,
              height: 300.0, // Adjust the height as needed
            ),
            SizedBox(height: 16.0),
            Text(
              recipe.name,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Blog Content:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(recipe.blogContent),
          ],
        ),
      ),
    );
  }
}
