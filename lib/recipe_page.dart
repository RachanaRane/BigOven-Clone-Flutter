import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecipePage extends StatefulWidget {
  final String imageUrl;
  final String title;

  RecipePage({required this.imageUrl, required this.title});

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  late String ingredients;
  late String recipe;
  bool showIngredients = true;

  @override
  void initState() {
    super.initState();
    // Load data from Firestore when the page is initialized
    loadRecipeData();
  }

  Future<void> loadRecipeData() async {
    try {
      // Fetch data from Firestore based on the recipe title
      var snapshot = await FirebaseFirestore.instance
          .collection('recipes')
          .where('title', isEqualTo: widget.title)
          .get();
      // Extract ingredients and recipe from the fetched document
      var data = snapshot.docs.first.data();
      setState(() {
        ingredients = data['ingredients'];
        recipe = data['recipe'];
      });
    } catch (e) {
      print('Error loading recipe data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            widget.imageUrl,
            height: 200.0,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showIngredients = true;
                  });
                },
                child: Text('Ingredients'),
              ),
              SizedBox(width: 20.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showIngredients = false;
                  });
                },
                child: Text('Recipe'),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          showIngredients
              ? Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      ingredients ?? 'Loading ingredients...',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                )
              : Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      recipe ?? 'Loading recipe...',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
