
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_first_app/grocerylist.dart';
import 'package:my_first_app/profile_page.dart';
import 'package:my_first_app/recipe_list_page.dart';
import 'package:my_first_app/recipe_page.dart';
import 'package:my_first_app/recripe_library.dart';
import 'package:my_first_app/video_player.dart';

void main() => runApp(Home_Page());

class Home_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.red, // Set primary color for the theme
      ),
    );
  }
}

class HomePage extends StatelessWidget {
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
                    Navigator.pushReplacementNamed(context, '/home');
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('recipes').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var document = snapshot.data!.docs[index];
              var data = document.data() as Map<String, dynamic>;
              var imageUrl = data['url'] ?? '';
              var title = data['title'] ?? '';
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipePage(imageUrl: imageUrl, title: title),
                    ),
                  );
                },
                 child: Card(
      child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.network(
          imageUrl,
          height: 300.0,
        ),
        Container(
          color: Colors.black.withOpacity(0.0),
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.0),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 16.0),
                  Icon(Icons.star, color: Colors.amber, size: 16.0),
                  Icon(Icons.star, color: Colors.amber, size: 16.0),
                  Icon(Icons.star_border, color: Colors.amber, size: 16.0),
                  Icon(Icons.star_border, color: Colors.amber, size: 16.0),
                ],
              ),
            ],
          ),
        ),
      ],
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
