import 'package:bouquetly_app/extension/app_size.dart';
import 'package:bouquetly_app/style/app_text_style.dart';
import 'package:flutter/material.dart';

class PageviewOne extends StatelessWidget {
  const PageviewOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Stack(
            children: [
              Image.asset(
                "assets/images/aboutus.jpg",
                width: context.getWidth()*0.9,
                height: context.getHight()*0.6,
                fit: BoxFit.cover,
              ),
              Container(
                  width: context.getWidth()*0.9,
                height: context.getHight()*0.6,
                color: Colors.white.withOpacity(0.3),
              ),
              Positioned(
                left: 40,
                top: 180,
                child: Text("BOUQUETLY", style: AppTextStyle.logoText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
