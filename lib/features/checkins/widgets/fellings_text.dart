import 'package:flutter/material.dart';

class FellingsText extends StatelessWidget {
  final String fellingName;

  const FellingsText({Key? key, required this.fellingName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(4),
      child: Text(
        fellingName,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}