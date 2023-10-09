import 'package:exercise2/model/user_details.dart';
import 'package:flutter/material.dart';

class User {
  final UserDetails details;
  final String username;
  final Color favorite_color;
  final bool notifications;
  final bool newsletter;
  final bool largeFont;

  static const default_user = const User(
    details: UserDetails(name: "James", surname: "Bond"),
    username: "jbond",
  );

  const User(
      {required this.details,
      required this.username,
      this.favorite_color = Colors.amber,
      this.notifications = true,
      this.newsletter = false,
      this.largeFont = false});

  User copyWith({
    UserDetails? details,
    String? surname,
    String? username,
    Color? favorite_color,
    bool? notifications,
    bool? newsletter,
    bool? largeFont,
  }) {
    return User(
      details: details ?? this.details,
      username: username ?? this.username,
      favorite_color: favorite_color ?? this.favorite_color,
      notifications: notifications ?? this.notifications,
      newsletter: newsletter ?? this.newsletter,
      largeFont: largeFont ?? this.largeFont,
    );
  }
}
