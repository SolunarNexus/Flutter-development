import 'package:exercise2/model/user_details.dart';
import 'package:exercise2/widget/labeled_text.dart';
import 'package:flutter/material.dart';

class UserDetailDisplay extends StatelessWidget {
  final UserDetails details;
  final double uiFontSize;
  final onEditPressed;

  const UserDetailDisplay({
    super.key,
    required this.details,
    required this.uiFontSize,
    required this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabeledText(label: 'Name: ', text: details.name, fontSize: uiFontSize),
        LabeledText(
            label: 'Surname: ', text: details.surname, fontSize: uiFontSize),
        ElevatedButton(
          onPressed: onEditPressed,
          child: Text('Edit'),
        ),
      ],
    );
  }
}
