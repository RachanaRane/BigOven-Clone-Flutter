import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_first_app/signUp.dart';
import 'home_page.dart'; // Import your home page file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.network(
              'https://e0.pxfuel.com/wallpapers/281/550/desktop-wallpaper-advertising-background-stirfried-synthetic-creative-catering-stirfrystir-fried-creative-synthe-food-poster-food-poster-design-food-background-thumbnail.jpg', // Replace with your background image path
              fit: BoxFit.cover,
            ),
          ),
          // Small image overlay
          Positioned(
            top: 50.0,
            left: 0,
            right: 0,
            child: Center(
              child: Image.network(
                'https://www.thespruceeats.com/thmb/ZCFiPKg38uekggmH0O29KRuyNeM=/fit-in/1500x750/filters:format(png):fill(white):max_bytes(150000):strip_icc()/Big_Oven-83f3ebe6d1ef4a2894c8b48e23cc0dbf.jpg', // Replace with your small image path
                width: 200,
                height: 200,
              ),
            ),
          ),
          // Login form
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      // Sign in the user with email and password
                      await _auth.signInWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );

                      // Navigate to home page after successful login
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home_Page()),
                      );
                    } catch (e) {
                      // Show an error message if sign-in fails
                      print('Login failed: $e');
                    }
                  },
                  child: Text('Login'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the create account page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text('Create Account'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
