import 'package:flutter/material.dart';
import 'package:task_manager/data/network_utils.dart';
import 'package:task_manager/ui/utils/snackbar_message.dart';
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

  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController firstNameEditingController = TextEditingController();
  final TextEditingController lastNameEditingController = TextEditingController();
  final TextEditingController mobileEditingController = TextEditingController();
  final TextEditingController passwordEditingController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackgroud(
        widget: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
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
                      controller: emailEditingController,
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
                      hintText: 'First Name',
                      controller: firstNameEditingController,
                      validator: (value){
                        if(value?.isEmpty ?? true){
                          return 'Enter your first name.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppTextFieldWidget(
                      hintText: 'Last Name',
                      controller: lastNameEditingController,
                      validator: (value){
                        if(value?.isEmpty ?? true){
                          return 'Enter your last name.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppTextFieldWidget(
                      hintText: 'Mobile',
                      controller: mobileEditingController,
                      validator: (value){
                        if(value?.isEmpty ?? true){
                          return 'Enter your mobile number.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppTextFieldWidget(
                      hintText: 'Password',
                      controller: passwordEditingController,
                      validator: (value){
                        if(value?.isEmpty ?? true){
                          return 'Enter valid password.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppElevatedButton(
                        child: Icon(Icons.arrow_circle_right_outlined),
                        onTap: () async {
                          if(_formkey.currentState!.validate()){
                            final result = await networkData.postMethod(
                              'https://task.teamrabbil.com/api/v1/registration',
                              bodyData: {
                                'email' : emailEditingController.text.toString().trim(),
                                'firstName' : firstNameEditingController.text.toString().trim(),
                                'lastName' : lastNameEditingController.text.toString().trim(),
                                'mobile' : mobileEditingController.text.toString().trim(),
                                'password' : passwordEditingController.text.toString().trim(),
                                'photo' : '',
                              }
                            );
                            if(result != null && result['status'] == 'success'){
                              emailEditingController.clear();
                              firstNameEditingController.clear();
                              lastNameEditingController.clear();
                              mobileEditingController.clear();
                              passwordEditingController.clear();
                              snackBarMessage(context,'Registration successfull.');
                            }else{
                              snackBarMessage(context,'Registration Failed.',true);
                            }

                          }
                        }
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
      ),
    );
  }
}
