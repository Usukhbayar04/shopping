import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  final String setTitle;
  const SettingsCard({super.key, required this.setTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          setTitle,
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        Icon(Icons.keyboard_arrow_down, size: 32),
      ],
    );
  }
}
