import 'package:flutter/material.dart';
import 'package:task_manager/ui/utils/text_styles.dart';
import 'package:task_manager/ui/widgets/app_elevated_button.dart';
import 'package:task_manager/ui/widgets/app_text_button_widget.dart';
import 'package:task_manager/ui/widgets/app_text_field_widget.dart';
import 'package:task_manager/ui/widgets/screen_background_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackgroud(
        widget: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Join With Us',
                    style: screenTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AppTextFieldWidget(
                    hintText: 'Email',
                    controller: TextEditingController(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextFieldWidget(
                    hintText: 'First Name',
                    controller: TextEditingController(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextFieldWidget(
                    hintText: 'Last Name',
                    controller: TextEditingController(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextFieldWidget(
                    hintText: 'Mobile',
                    controller: TextEditingController(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextFieldWidget(
                    hintText: 'Password',
                    controller: TextEditingController(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppElevatedButton(
                      child: Icon(Icons.arrow_circle_right_outlined),
                      onTap: (){}
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextButton(
                    textTitle: "Already have an account?",
                    textButton: "Sign In",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
