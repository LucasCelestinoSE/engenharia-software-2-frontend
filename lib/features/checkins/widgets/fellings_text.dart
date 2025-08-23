import 'package:flutter/material.dart';

class FellingsText extends StatelessWidget {
  final String fellingName;
  final bool isSelected;
  final VoidCallback onTap;

  const FellingsText({
    Key? key, 
    required this.fellingName,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
        ),
        padding: const EdgeInsets.all(8),
        child: Text(
          fellingName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.blue : Colors.black,
          ),
        ),
      ),
    );
  }
}