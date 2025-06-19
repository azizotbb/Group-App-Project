import 'package:bouquetly_app/widget/background_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(children: [BackgroundImg()]),
        ],
      ),
    );
  }
}
