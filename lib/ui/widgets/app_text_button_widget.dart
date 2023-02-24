
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key, required this.textTitle, required this.onTap, required this.textButton,
  });
  final String textTitle;
  final VoidCallback onTap;
  final String textButton;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textTitle),
        TextButton(
            onPressed: onTap,
            child: Text(
              textButton,
              style: TextStyle(color: Colors.green),
            )),
      ],
    );
  }
}
