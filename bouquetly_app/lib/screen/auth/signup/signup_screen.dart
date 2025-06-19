import 'package:bouquetly_app/screen/auth/signin/signin_screen.dart';
import 'package:bouquetly_app/style/app_text_style.dart';
import 'package:bouquetly_app/widget/auth/auth_button.dart';
import 'package:bouquetly_app/widget/auth/auth_text_field.dart';
import 'package:bouquetly_app/widget/background_img.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(children: [BackgroundImg()]),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              height: 500,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.5),
              ),
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Text("Sign Up", style: AppTextStyle.logoText),
                      AuthTextField(hinttext: "Name"),
                      SizedBox(height: 30),
                      AuthTextField(hinttext: "Enter email or your number"),
                      SizedBox(height: 30),

                      AuthTextField(hinttext: "Password"),

                      SizedBox(height: 40),

                      AuthButton(buttonText: "Sign up"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SigninScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 182, 175, 169),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
