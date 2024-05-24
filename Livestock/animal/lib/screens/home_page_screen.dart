import 'package:flutter/material.dart';
import 'package:animal/screens/registered_user_screen.dart'; // Import RegisteredUserScreen

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String _selectedItem = 'Registered Users'; // Default selected item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          DropdownButton<String>(
            value: _selectedItem,
            items: <String>[
              'Registered Users',
              'Registered Animals',
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedItem = newValue!;
              });
              if (_selectedItem == 'Registered Users') {
                Navigator.pushNamed(context, 'registered_users');
              } else if (_selectedItem == 'Registered Animals') {
                // Add navigation to RegisteredAnimalsScreen when implemented
                print('Registered Animals selected');
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome to our app!',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'login', (Route<dynamic> route) => false);
                },
                child: Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
