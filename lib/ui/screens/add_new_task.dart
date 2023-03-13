import 'package:flutter/material.dart';
import 'package:task_manager/data/auth_utils.dart';
import 'package:task_manager/data/network_utils.dart';
import 'package:task_manager/data/urls.dart';
import 'package:task_manager/ui/screens/main_bottom_nav_bar.dart';
import 'package:task_manager/ui/utils/snackbar_message.dart';
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
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Select Task"), value: ''),
      DropdownMenuItem(child: Text("New"), value: "New"),
      DropdownMenuItem(child: Text("Complete"), value: "Completed"),
      DropdownMenuItem(child: Text("In Progress"), value: "Inprogress"),
    ];
    return menuItems;
  }

  late String selectedValue = '';

  final TextEditingController subjectEditingController =
      TextEditingController();
  final TextEditingController descriptionEditingController =
      TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late bool _inProgress = false;

  Future<void> addNewTask() async {
    _inProgress = true;
    setState(() {});
    final result =
        await networkData.postMethod(
            Urls.createNewTaskUrl,
            bodyData: {
              'title': subjectEditingController.text.toString().trim(),
              'description': descriptionEditingController.text.toString().trim(),
              'status': selectedValue,
            },
            onUnauthorized: () {
            snackBarMessage(
              context, 'invaild login user please try again with login', true);
            }
    );
    _inProgress = true;
    setState(() {});

    if (result != null && result['status'] == 'success') {
      subjectEditingController.clear();
      descriptionEditingController.clear();
      snackBarMessage(context, 'Add New Task successfull.');
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MainBottomNavBarScreen()));
    } else {
      _inProgress = false;
      setState(() {});
      snackBarMessage(context, 'Add New Task is Failed.', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          UserProfile(),
          Expanded(
              child: ScreenBackgroud(
            widget: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Add New Task",
                        style: screenTitleTextStyle,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      AppTextFieldWidget(
                        hintText: 'Subject',
                        controller: subjectEditingController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Enter your subject.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      AppTextFieldWidget(
                        hintText: 'Description',
                        controller: descriptionEditingController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Enter Description.';
                          }
                          return null;
                        },
                        maxline: 6,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      DropdownButtonFormField(
                          isExpanded: true,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          dropdownColor: Colors.white,
                          validator: (value) =>
                              value == null ? "Select a Status" : null,
                          items: dropdownItems,
                          value: selectedValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue!;
                            });
                          }),
                      SizedBox(
                        height: 12,
                      ),
                      if (_inProgress)
                        Center(
                          child: CircularProgressIndicator(
                            color: Colors.green,
                          ),
                        )
                      else
                        AppElevatedButton(
                            child: Icon(Icons.arrow_circle_right_outlined),
                            onTap: () {
                              if (_formkey.currentState!.validate()) {
                                addNewTask();
                              }
                            }),
                    ],
                  ),
                ),
              ),
            ),
          ))
        ],
      )),
    );
  }
}
