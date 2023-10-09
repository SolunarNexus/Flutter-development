import 'package:flutter/material.dart';

const _settings_card_height = 60.0;
const _horizontal_gap = 12.0;
const _vertical_margin = 6.0;

class SettingsCard extends StatelessWidget {
  final String label;
  final Widget child;
  final double fontSize;

  const SettingsCard({
    super.key,
    required this.label,
    required this.child,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _settings_card_height,
      color: Colors.blue[100],
      margin: const EdgeInsets.symmetric(vertical: _vertical_margin),
      padding: const EdgeInsets.symmetric(horizontal: _horizontal_gap),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: fontSize)),
          child,
        ],
      ),
    );
  }
}
