import 'package:flutter/material.dart';

class LabeledText extends StatelessWidget {
  final String label;
  final String text;
  final double fontSize;

  const LabeledText({
    super.key,
    required this.label,
    required this.text,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$label',
            style: TextStyle(color: Colors.grey, fontSize: fontSize)),
        Text(text, style: TextStyle(fontSize: fontSize))
      ],
    );
  }
}
