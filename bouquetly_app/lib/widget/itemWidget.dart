import 'package:bouquetly_app/screen/store_cart/bloc/store_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Itemwidget extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  final String category;
  const Itemwidget({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.category,
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
            child: Image.asset(
              image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(6),
            child: Column(
              children: [
                const SizedBox(height: 2),
                Text(name, style: const TextStyle(fontSize: 16)),
                Text(category, style: const TextStyle(fontSize: 12)),
                const SizedBox(height: 2),
                Text("${price} SAR", style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              context.read<StoreBloc>().add(
                additem(image: image, name: name, price: price),
              );
            },
            child: Text(
              "Add to cart",
              style: TextStyle(color: Color(0xFFB6AFA9), fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
