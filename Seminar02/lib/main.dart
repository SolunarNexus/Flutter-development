import 'package:exercise2/profile_page.dart';
import 'package:exercise2/user.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const UserProfileApp());
}

class UserProfileApp extends StatelessWidget {
  const UserProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Second Flutter Exercise',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home:
          const ProfilePage(currentUser: User(name: 'Adam', surname: 'Valent')),
    );
  }
}
