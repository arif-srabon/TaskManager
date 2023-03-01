import 'package:flutter/material.dart';
import 'package:task_manager/data/network_utils.dart';
import 'package:task_manager/data/urls.dart';
import 'package:task_manager/ui/screens/main_bottom_nav_bar.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';
import 'package:task_manager/ui/screens/verify_with_email_screen.dart';
import 'package:task_manager/ui/utils/snackbar_message.dart';
import 'package:task_manager/ui/utils/text_styles.dart';
import 'package:task_manager/ui/widgets/app_elevated_button.dart';
import 'package:task_manager/ui/widgets/app_text_button_widget.dart';
import 'package:task_manager/ui/widgets/screen_background_widget.dart';

import '../widgets/app_text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailTextEditingController = TextEditingController();
  final TextEditingController passwordTextEditingController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackgroud(
          widget: Padding(
        padding: const EdgeInsets.all(24.0),
        child:  Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Get Started With',
                style: screenTitleTextStyle,
              ),
              const SizedBox(
                height: 24,
              ),
              AppTextFieldWidget(
                hintText: 'Email',
                controller: emailTextEditingController,
                validator: (value){
                  if(value?.isEmpty ?? true){
                    return 'Enter your email.';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AppTextFieldWidget(
                hintText: 'Password',
                controller: passwordTextEditingController,
                validator: (value){
                  if(value?.isEmpty ?? true){
                    return 'Enter your password.';
                  }
                  return null;
                },
                obscureText: true,
              ),
              const SizedBox(
                height: 16,
              ),
              AppElevatedButton(
                child: Icon(Icons.arrow_circle_right_outlined),
                onTap: () async {
                  if(_formkey.currentState!.validate()){
                    final result = await networkData.postMethod(
                        Urls.loginUrl,
                        bodyData: {
                          'email' : emailTextEditingController.text.toString().trim(),
                          'password' : passwordTextEditingController.text.toString().trim(),
                        },
                        onUnauthorized: (){
                            snackBarMessage(context, 'username or password is invaild',true);
                        }
                    );
                    if(result != null && result['status'] == 'success'){
                      emailTextEditingController.clear();
                      passwordTextEditingController.clear();
                      snackBarMessage(context,'Registration successfull.');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainBottomNavBarScreen()));
                    }else{
                      snackBarMessage(context,'Registration Failed.',true);
                    }

                  }

                },
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyWithEmailScreen()));
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey),
                    )),
              ),
              AppTextButton(
                textTitle: "Don't have an account?",
                textButton: "Sign Up",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
