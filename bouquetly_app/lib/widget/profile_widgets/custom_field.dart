import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({super.key, required this.setHint, this.controller, this.validator});

  final String setHint;
  final TextEditingController? controller;
  final String? Function(String?)?  validator;


  @override
  Widget build(BuildContext context) {
    return TextFormField(controller: controller,
    validator: validator,
      decoration: InputDecoration(
        hint: Text(setHint),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
