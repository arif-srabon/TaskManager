import 'package:flutter/material.dart';

class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText,
    this.maxline,
    this.validator,
    this.readOnly,
  });

  final String hintText;
  final TextEditingController controller;
  final bool? obscureText;
  final int? maxline;
  final  Function(String?)? validator;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
        if(validator != null){
          return validator!(value);
        }
        return null;
      },
      controller: controller,
      obscureText: obscureText ?? false,
      maxLines: maxline ?? 1,
      readOnly: readOnly ?? false,
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
