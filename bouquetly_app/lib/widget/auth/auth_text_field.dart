import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String hinttext;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  const AuthTextField({
    super.key,
    required this.hinttext,
    required this.controller,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(hintText: hinttext),
    );
  }
}
