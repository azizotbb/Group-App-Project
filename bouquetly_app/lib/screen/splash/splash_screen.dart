import 'package:bouquetly_app/screen/auth/signin/signin_screen.dart';
import 'package:bouquetly_app/style/app_text_style.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => SigninScreen()),
      );
    });
    return Scaffold(
      body: Center(child: Text("BOUQUETLY", style: AppTextStyle.logoText)),
    );
  }
}
