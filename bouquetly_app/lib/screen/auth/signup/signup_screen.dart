import 'package:bouquetly_app/screen/auth/signin/signin_screen.dart';
import 'package:bouquetly_app/screen/auth/signup/bloc/signup_bloc.dart';
import 'package:bouquetly_app/style/app_text_style.dart';
import 'package:bouquetly_app/widget/auth/auth_button.dart';
import 'package:bouquetly_app/widget/auth/auth_text_field.dart';
import 'package:bouquetly_app/widget/background_img.dart';
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
                      key: bloc.formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            Text("Sign Up", style: AppTextStyle.logoText),
                            AuthTextField(
                              hinttext: "Name",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "name is Empty";
                                } else if (value.length > 12) {
                                  return "Name must be less than 13 characters.";
                                }
                                return null;
                              },
                              controller: bloc.nameController,
                            ),
                            SizedBox(height: 30),
                            AuthTextField(
                              hinttext: "Email ",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "eamil is empty";
                                } else if (!value.contains(
                                  RegExp(
                                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$',
                                  ),
                                )) {
                                  return "Please enter a valid email address";
                                }
                                return null;
                              },
                              controller: bloc.emailController,
                            ),
                            SizedBox(height: 30),

                            AuthTextField(
                              hinttext: "Password",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Password is Empty";
                                } else if (value.length < 6) {
                                  return "Password must be at least 6 characters long. Please try again";
                                } else if (!value.contains(RegExp(r'\d'))) {
                                  return "Please include at least one number";
                                }
                                return null;
                              },
                              controller: bloc.passwordController,
                              obscureText: true,
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
                                  return Text(
                                    "A verification email has been sent.",
                                    style: TextStyle(color: Colors.green),
                                  );
                                }
                                return Container();
                              },
                            ),
                            AuthButton(
                              buttonText: "Sign up",
                              onPressed: () {
                                if (bloc.formKey.currentState!.validate()) {
                                  bloc.add(CreateNewAccountEvent());
                                }
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
