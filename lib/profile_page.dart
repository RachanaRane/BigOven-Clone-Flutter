import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_first_app/login.dart';
import 'package:my_first_app/recripe_library.dart';

class ProfilePage extends StatefulWidget {
  final User? user;

  ProfilePage({Key? key, this.user}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load user profile data when the page is initialized
    loadProfileData();
  }

  Future<void> loadProfileData() async {
    try {
      String userId = widget.user!.uid;
      var snapshot = await FirebaseFirestore.instance.collection('users').doc(userId).get();
      if (snapshot.exists) {
        var data = snapshot.data() as Map<String, dynamic>;
        setState(() {
          _firstNameController.text = data['firstName'] ?? '';
          _descriptionController.text = data['description'] ?? '';
        });
      }
    } catch (error) {
      print('Error loading profile data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://t3.ftcdn.net/jpg/05/16/27/58/360_F_516275801_f3Fsp17x6HQK0xQgDQEELoTuERO4SsWV.jpg',
                ),
              ),
              SizedBox(height: 24.0),
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                enabled: false,
                controller: TextEditingController(text: widget.user?.email ?? ''),
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  saveProfileDetails();
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveProfileDetails() async {
    try {
      String userId = widget.user!.uid;
      String firstName = _firstNameController.text;
      String lastName = _lastNameController.text;
      String description = _descriptionController.text;

      // Save profile details to Firestore
      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'firstName': firstName,
        'lastName': lastName,
        'description': description,
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Profile details saved successfully!'),
        duration: Duration(seconds: 2),
      ));
    } catch (error) {
      print('Error saving profile details: $error');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to save profile details. Please try again later.'),
        duration: Duration(seconds: 2),
      ));
    }
  }
}
