import 'package:flutter/material.dart';

class User {
  final name;
  final surname;
  final username;
  final Color favorite_color;

  const User(
      {this.name = 'Pavel',
      this.surname = 'Jakubec',
      this.username = 'pjakubec',
      this.favorite_color = Colors.amber});
}
