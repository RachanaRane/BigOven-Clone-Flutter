import 'package:my_first_app/grocerylist.dart';
import 'package:my_first_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/recripe_library.dart';
import 'package:my_first_app/video_player.dart';


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
      blogContent: """
Celebrating with Cakes: A Sweet Tradition

A Slice of History
The history of cakes dates back thousands of years, with evidence of early forms found in ancient civilizations such as Egypt and Greece. Initially, these early cakes were simple, often made with honey, nuts, and dried fruits. Over time, as ingredients and baking techniques evolved, cakes became more elaborate and varied.

The Art of Cake Making
Today, cake making is not just a culinary endeavor; it's an art form. From classic layer cakes adorned with intricate frosting designs to sculpted masterpieces that push the boundaries of creativity, the possibilities are endless. Bakers around the world experiment with flavors, textures, and decorations to create cakes that are as visually stunning as they are delicious.

A Cake for Every Occasion
One of the most beautiful aspects of cakes is their versatility. There's a cake for every occasion, each with its own unique style and flavor profile. Birthdays call for towering layer cakes topped with candles, while weddings often feature elegant tiered creations adorned with delicate flowers. Baby showers, graduations, anniversaries – no matter the event, there's a cake that perfectly captures its spirit.

Beyond the Sweetness
While cakes are undeniably sweet treats, they also hold deeper meaning in our lives. They serve as a symbol of love, care, and connection, bringing people together to share in moments of joy and celebration. Cutting the first slice of a wedding cake or blowing out the candles on a birthday cake are traditions that create lasting memories and strengthen bonds between family and friends.

Looking to the Future
As we move forward, the tradition of cake making continues to evolve. Bakers experiment with new flavors and techniques, incorporating global influences and culinary trends into their creations. Vegan and gluten-free options are becoming more prevalent, ensuring that everyone can enjoy a slice of cake, regardless of dietary restrictions.

In an ever-changing world, one thing remains constant: the joy that cakes bring to our lives. Whether it's a simple sheet cake shared among friends or an elaborate showstopper designed for a special occasion, cakes have a way of brightening our days and filling our hearts with happiness. So, the next time you find yourself gathered around a beautifully decorated cake, take a moment to appreciate not only its delicious taste but also the tradition, artistry, and love that went into creating it. After all, cake isn't just dessert – it's a celebration on a plate.
""",
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
        backgroundColor: Colors.red,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
                // Replace with your Bigoven logo asset
            ),
            Text(
              'Bigoven',
              style: TextStyle(
              fontSize: 20,
              color: Colors.white, // Set text color to white
  ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                // Handle logout action here
                // Navigate to login page
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight), // Adjust the height as needed
          child: BottomAppBar(
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    // Home navigation
                    Navigator.push(context, 
                    MaterialPageRoute(
                        builder: (context) => Home_Page(), // Replace with your RecipeListPage widget
                      ),);
                  },
                   style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    ),
                  child: Text('Home'),
                ),
                TextButton(
                  onPressed: () {
                    // Recipes navigation
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp(), // Replace with your RecipeListPage widget
                      ),
                    );
                  },
                   style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    ),
                  child: Text('Recipe'),
                ),
                TextButton(
                  onPressed: () {
                    // Profile navigation
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Grocery(),
                      ),
                    );
                  },
                   style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    ),
                  child: Text('Grocery'),
                ),
                TextButton(
                  onPressed: () {
                    // My Recipes navigation
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Recipelib(),
                      ),
                    );
                  },
                   style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    ),
                  child: Text('New'),
                ),
                TextButton(
                  onPressed: () {
                    // Videos navigation
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoPlayerApp(),
                      ),
                    );
                  },
                   style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    ),
                  child: Text('Videos'),
                ),
              ],
            ),
          ),
        ),
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
