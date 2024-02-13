import 'package:flutter/material.dart';
import 'package:my_first_app/recripe_library.dart';
import 'recipe_list_page.dart';

import 'profile_page.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text('Welcome to the Recipe App!'),
      ),
         bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red, // Set the background color to red
        selectedItemColor: Colors.white, // Set the selected item color to white
           unselectedItemColor: Colors.white, // Set the unselected item color to white
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
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyApp(),
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
