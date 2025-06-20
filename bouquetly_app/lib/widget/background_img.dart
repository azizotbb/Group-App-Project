import 'package:bouquetly_app/extension/app_size.dart';
import 'package:flutter/material.dart';

class BackgroundImg extends StatelessWidget {
  const BackgroundImg({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: context.getWidth(),
      child: Image.asset(
        "assets/images/aboutus.jpg",
        fit: BoxFit.cover,
        opacity: const AlwaysStoppedAnimation(0.7),
      ),
    );
  }
}
