import 'package:flutter/material.dart';
import 'package:task_manager/ui/utils/text_styles.dart';
import 'package:task_manager/ui/widgets/app_elevated_button.dart';
import 'package:task_manager/ui/widgets/app_text_field_widget.dart';
import 'package:task_manager/ui/widgets/screen_background_widget.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenBackgroud(
          widget: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ SizedBox(
                  height: 24,
                ),

                  Text(
                    'Update Your Profile',
                    style: screenTitleTextStyle,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5)
                            )
                          ),
                          child: Text('Photo'),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5)
                                )
                            ),
                            child: Text(''),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  AppTextFieldWidget(
                      hintText: 'Email', controller: TextEditingController()),
                  SizedBox(
                    height: 6,
                  ),
                  AppTextFieldWidget(
                      hintText: 'First Name',
                      controller: TextEditingController()),
                  SizedBox(
                    height: 6,
                  ),
                  AppTextFieldWidget(
                      hintText: 'Last Name', controller: TextEditingController()),
                  SizedBox(
                    height: 6,
                  ),
                  AppTextFieldWidget(
                      hintText: 'Mobile', controller: TextEditingController()),
                  SizedBox(
                    height: 6,
                  ),
                  AppTextFieldWidget(
                      hintText: 'Password',
                      obscureText: true,
                      controller: TextEditingController()),
                  SizedBox(
                    height: 6,
                  ),
                  AppElevatedButton(
                      child: Icon(Icons.arrow_circle_right_outlined),
                      onTap: () {})
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
