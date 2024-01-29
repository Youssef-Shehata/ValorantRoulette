import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  CustomText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text,
          style:
              TextStyle(color: Colors.grey[300], fontWeight: FontWeight.bold)),
    );
  }
}
