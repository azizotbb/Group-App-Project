import 'package:bouquetly_app/extension/app_size.dart';
import 'package:bouquetly_app/style/app_text_style.dart';
import 'package:flutter/material.dart';

class PageViewTwo extends StatelessWidget {
  const PageViewTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Container(
            width: context.getWidth() * 0.9,
            height: context.getHight() * 0.6,
            color: Colors.white.withOpacity(0.3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                              SizedBox(height: 40),
                Text("BOUQUETLY", style: AppTextStyle.logoText),
                const SizedBox(height: 10),

                const Text(
                  "About Us",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 30),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "At Bouquetly, beauty is always one tap away. Choose from elegant ready-made bouquets and get them delivered right to your door — fresh, fast, and full of love.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      wordSpacing: 4,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
