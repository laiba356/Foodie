import 'package:flutter/material.dart';

Widget buildTopTab(BuildContext context, String title, IconData icon,
    {bool isSelected = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      children: [
        Icon(
          icon,
          color: isSelected ? Colors.blue : Colors.grey,
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.blue : Colors.grey,
          ),
        ),
      ],
    ),
  );
}
