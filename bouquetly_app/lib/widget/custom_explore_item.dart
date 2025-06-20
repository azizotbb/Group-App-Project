import 'package:bouquetly_app/extension/app_size.dart';
import 'package:flutter/material.dart';

class CustomExploreItem extends StatelessWidget {
  const CustomExploreItem({
    super.key,
    required this.name,
    required this.image,
    required this.desc,
  });
  final String name;
  final String image;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.getHight() / 2.7,
          width: context.getWidth() / 1,

          child: Stack(
            children: [
              Container(
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 236, 232, 228),
                ),
              ),
              Positioned(
                top: 40,
                left: 30,
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                ),
              ),

              Positioned(
                top: 100,
                left: 10,
                child: Text(
                  desc,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Positioned(
                left: 150,
                bottom: 50,
                child: Image.asset(image, height: 250, width: 250),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
