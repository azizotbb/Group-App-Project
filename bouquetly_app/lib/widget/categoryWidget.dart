
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String label;
  const CategoryWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) { // widget category 
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Chip(
        label: Text(label, style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 182, 175, 169),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),
    );
  }
}
