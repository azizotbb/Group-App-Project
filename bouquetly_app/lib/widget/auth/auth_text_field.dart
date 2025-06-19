import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String hinttext;
  const AuthTextField({super.key, required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return TextFormField(decoration: InputDecoration(hintText: hinttext));
  }
}
