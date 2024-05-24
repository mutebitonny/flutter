import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:animal/screens/login_screen.dart';
import 'package:animal/screens/registration_screen.dart';
import 'package:animal/screens/home_page_screen.dart';
import 'package:animal/screens/registered_user_screen.dart'; // Import RegisteredUserScreen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyBqQ8pqpUBAX639cnL24DGxQ6xHOyGPqiQ",
        authDomain: "livestock-tracking-syste-ba3fd.firebaseapp.com",
        databaseURL: "https://livestock-tracking-syste-ba3fd-default-rtdb.firebaseio.com",
        projectId: "livestock-tracking-syste-ba3fd",
        storageBucket: "livestock-tracking-syste-ba3fd.appspot.com",
        messagingSenderId: "19596435258",
        appId: "1:19596435258:web:65e44e8b9dff820024ba03",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginScreen(),
        'register': (context) => RegistrationScreen(),
        'home': (context) => HomePageScreen(),
        'registered_users': (context) => RegisteredUserScreen(), // Add the route for RegisteredUserScreen
      },
    );
  }
}
