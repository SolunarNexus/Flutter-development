import 'package:exercise2/model/user.dart';
import 'package:flutter/material.dart';

const _avatar_size = 50.0;

class Avatar extends StatelessWidget {
  final User user;

  const Avatar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _avatar_size,
      height: _avatar_size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.deepPurple,
      ),
      child: Center(
        child: Text(
          '${_getInitialFromString(user.details.name)}${_getInitialFromString(user.details.surname)}',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  String _getInitialFromString(String input) => input.isEmpty ? '' : input[0];
}
