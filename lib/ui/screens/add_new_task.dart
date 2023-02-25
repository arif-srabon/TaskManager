import 'package:flutter/material.dart';
import 'package:task_manager/ui/utils/text_styles.dart';
import 'package:task_manager/ui/widgets/app_elevated_button.dart';
import 'package:task_manager/ui/widgets/app_text_field_widget.dart';
import 'package:task_manager/ui/widgets/screen_background_widget.dart';
import 'package:task_manager/ui/widgets/user_profile_widget.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            UserProfile(),
            Expanded(child: ScreenBackgroud(
              widget: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 7,),
                      Text("Add New Task", style: screenTitleTextStyle,),
                      SizedBox(height: 7,),
                      AppTextFieldWidget(hintText: 'Subject', controller: TextEditingController()),
                      SizedBox(height: 7,),
                      AppTextFieldWidget(hintText: 'Description', controller: TextEditingController(),maxline: 6,),
                      SizedBox(height: 7,),
                      AppTextFieldWidget(hintText: 'Date', controller: TextEditingController()),
                      SizedBox(height: 12,),
                      AppElevatedButton(child: Icon(Icons.arrow_circle_right_outlined), onTap: (){

                      }),
                    ],
                  ),
                ),
              ),
            ))
          ],
        )
      ),
    );
  }
}
