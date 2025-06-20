import 'package:bouquetly_app/screen/auth/signin/signin_screen.dart';
import 'package:bouquetly_app/screen/auth/signup/bloc/signup_bloc.dart';
import 'package:bouquetly_app/style/app_text_style.dart';
import 'package:bouquetly_app/widget/auth/auth_button.dart';
import 'package:bouquetly_app/widget/auth/auth_text_field.dart';
import 'package:bouquetly_app/widget/background_img.dart';
import 'package:bouquetly_app/widget/bottomNavigation/bottom_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<SignupBloc>();
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                Column(children: [BackgroundImg()]),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    height: 560,
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
                            AuthTextField(
                              hinttext: "Name",
                              controller: bloc.nameController,
                            ),
                            SizedBox(height: 30),
                            AuthTextField(
                              hinttext: "Email ",
                              controller: bloc.emailController,
                            ),
                            SizedBox(height: 30),

                            AuthTextField(
                              hinttext: "Password",
                              controller: bloc.passwordController,
                            ),

                            SizedBox(height: 40),
                            BlocBuilder<SignupBloc, SignupState>(
                              builder: (context, state) {
                                if (state is ErrorState) {
                                  return Text(
                                    state.msg,
                                    style: TextStyle(color: Colors.red),
                                  );
                                }
                                if (state is SuccessState) {
                                  Future.delayed(
                                    const Duration(seconds: 2),
                                    () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              BottomNavigationWidget(),
                                        ),
                                      );
                                    },
                                  );
                                  return Text(
                                    "Register Successfully",
                                    style: TextStyle(color: Colors.green),
                                  );
                                }
                                return Container();
                              },
                            ),
                            AuthButton(
                              buttonText: "Sign up",
                              onPressed: () {
                                // Navigator.pushReplacement(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         BottomNavigationWidget(),
                                //   ),
                                // );

                                bloc.add(CreateNewAccountEvent());
                              },
                            ),
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
                                  color: const Color.fromARGB(
                                    255,
                                    182,
                                    175,
                                    169,
                                  ),
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
        },
      ),
    );
  }
}
