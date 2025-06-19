import 'package:bouquetly_app/screen/auth/signup/signup_screen.dart';
import 'package:bouquetly_app/style/app_text_style.dart';
import 'package:bouquetly_app/widget/auth/auth_button.dart';
import 'package:bouquetly_app/widget/auth/auth_text_field.dart';
import 'package:bouquetly_app/widget/background_img.dart';
import 'package:bouquetly_app/widget/bottomNavigation/bottom_navigation_widget.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

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
              height: 465,
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
                      Text("Sign In", style: AppTextStyle.logoText),
                      AuthTextField(hinttext: "Enter email or your number"),
                      SizedBox(height: 30),
                      AuthTextField(hinttext: "Password"),
                      SizedBox(height: 40),

                      AuthButton(
                        buttonText: "Sign In",
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomNavigationWidget(),
                            ),
                          );
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
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
