import 'package:exercise2/widget/profile_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const UserProfileApp());
}

class UserProfileApp extends StatelessWidget {
  const UserProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Third Flutter Exercise',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const ProfilePage(),
    );
  }
}
