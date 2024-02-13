import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://t3.ftcdn.net/jpg/05/16/27/58/360_F_516275801_f3Fsp17x6HQK0xQgDQEELoTuERO4SsWV.jpg',
                    ),
                  ),
                  Row(
                    children: [
                      MetricItem(metric: 'Recipes', count: '100'),
                      SizedBox(width: 16.0),
                      MetricItem(metric: 'Followers', count: '500'),
                       SizedBox(width: 16.0),
                      MetricItem(metric: 'Following', count: '200'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'First Name'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Last Name'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  // Add logic to save the user details
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MetricItem extends StatelessWidget {
  final String metric;
  final String count;

  MetricItem({required this.metric, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          metric,
          style: TextStyle(fontSize: 16.0),
        ),
        Text(
          count,
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
