import 'package:exercise2/user.dart';
import 'package:flutter/material.dart';

const _AVATAR_SIZE = 50.0;

class Avatar extends StatelessWidget {
  final User user;

  const Avatar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _AVATAR_SIZE,
      height: _AVATAR_SIZE,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.deepPurple,
      ),
      child: Center(
        child: Text(
          '${_getInitialFromString(user.name)}${_getInitialFromString(user.surname)}',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  String _getInitialFromString(String input) => input.isEmpty ? '' : input[0];
}
