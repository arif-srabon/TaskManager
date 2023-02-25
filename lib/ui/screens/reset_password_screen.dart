import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/login.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';
import 'package:task_manager/ui/screens/verify_with_email_screen.dart';
import 'package:task_manager/ui/utils/text_styles.dart';
import 'package:task_manager/ui/widgets/app_elevated_button.dart';
import 'package:task_manager/ui/widgets/app_text_button_widget.dart';
import 'package:task_manager/ui/widgets/app_text_field_widget.dart';
import 'package:task_manager/ui/widgets/screen_background_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackgroud(
          widget: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Set Password',
                  style: screenTitleTextStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Minimum length password 8 character with Letter and Number Combination.',
                  style: screenSubTitleTextStyle,
                ),
                const SizedBox(
                  height: 24,
                ),
                AppTextFieldWidget(
                  hintText: 'Password',
                  controller: TextEditingController(),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextFieldWidget(
                  hintText: 'Confirm Password',
                  controller: TextEditingController(),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                AppElevatedButton(
                  child: Icon(Icons.arrow_circle_right_outlined),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextButton(
                  textTitle: "Already have an account?",
                  textButton: "Sign In",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
              ],
            ),
          )),
    );
  }
}
