import 'package:bouquetly_app/style/app_colors.dart';
import 'package:flutter/material.dart';

class Itemwidget extends StatelessWidget {
  final String image;
  final String name;
  final int price;

  const Itemwidget({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(image, height: 120, fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.all(6),
            child: Column(
              children: [
                const SizedBox(height: 2),
                Text(name, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 2),
                Text("${price}SAR", style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Add to cart",
              style: TextStyle(color:AppColors.lightBeige, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}