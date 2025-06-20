import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String hinttext;
  final TextEditingController controller;
  const AuthTextField({
    super.key,
    required this.hinttext,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hinttext),
    );
  }
}
