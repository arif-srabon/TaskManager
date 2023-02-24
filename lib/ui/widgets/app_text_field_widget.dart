import 'package:flutter/material.dart';

class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText,
  });

  final String hintText;
  final TextEditingController controller;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          hintText: hintText,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none
          )
      ),
    );
  }
}
