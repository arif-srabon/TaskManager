import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manager/data/auth_utils.dart';
import 'package:task_manager/data/network_utils.dart';
import 'package:task_manager/data/urls.dart';
import 'package:task_manager/ui/utils/snackbar_message.dart';
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
  bool _inprogress = false;
  final TextEditingController _emailETController = TextEditingController();
  final TextEditingController _firstNameETController = TextEditingController();
  final TextEditingController _lastNameETController = TextEditingController();
  final TextEditingController _mobileETController = TextEditingController();
  final TextEditingController _passwordETController = TextEditingController();
  XFile? pickedImage;
  String? base64Image;

  initState() {
    _emailETController.text = AuthUtils.email ?? '';
    _firstNameETController.text = AuthUtils.firstName ?? '';
    _lastNameETController.text = AuthUtils.lastName ?? '';
    _mobileETController.text = AuthUtils.mobile ?? '';
  }

  void profileUpdate() async {
    _inprogress = true;
    setState(() {});

    if (pickedImage != null) {
      List<int> byteImage = await pickedImage!.readAsBytes();
      base64Image = base64Encode(byteImage);
    }

    Map<String, String> bodyParams = {
      'firstName': _firstNameETController.text.trim(),
      'lastName': _lastNameETController.text.trim(),
      'mobile': _mobileETController.text.trim(),
      'photo': base64Image ?? '',
    };
    if (_passwordETController.text.trim().isNotEmpty) {
      bodyParams['password'] = _passwordETController.text.trim();
    }

    final result = await networkData.postMethod(
      Urls.profileUpdate,
      bodyData: bodyParams,
    );
    if (result != null && result['status'] == 'success') {
      AuthUtils.firstName = _firstNameETController.text.trim();
      AuthUtils.lastName = _lastNameETController.text.trim();
      AuthUtils.mobile = _mobileETController.text.trim();
      AuthUtils.photo = base64Image;

      snackBarMessage(context, "Profile Updated successfull");
    } else {
      snackBarMessage(context, "Profile Updated failed", true);
    }
    _inprogress = false;
    setState(() {});
  }

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
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Update Your Profile',
                    style: screenTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: () async {
                      pickedImageFrom();
                    },
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5))),
                          child: const Text('Photo'),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
                            child: Text(pickedImage?.name ?? ''),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  AppTextFieldWidget(
                      hintText: 'Email',
                      readOnly: true,
                      controller: _emailETController),
                  const SizedBox(
                    height: 6,
                  ),
                  AppTextFieldWidget(
                      hintText: 'First Name',
                      controller: _firstNameETController),
                  const SizedBox(
                    height: 6,
                  ),
                  AppTextFieldWidget(
                      hintText: 'Last Name', controller: _lastNameETController),
                  const SizedBox(
                    height: 6,
                  ),
                  AppTextFieldWidget(
                      hintText: 'Mobile', controller: _mobileETController),
                  const SizedBox(
                    height: 6,
                  ),
                  AppTextFieldWidget(
                      hintText: 'Password',
                      obscureText: true,
                      controller: _passwordETController),
                  const SizedBox(
                    height: 6,
                  ),
                  (_inprogress)
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.green,
                          ),
                        )
                      : AppElevatedButton(
                          child: const Icon(Icons.arrow_circle_right_outlined),
                          onTap: () {
                            profileUpdate();
                          })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void pickedImageFrom() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Picked Image Form'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('From Camera'),
                  leading: const Icon(Icons.camera),
                  onTap: () async {
                    pickedImage = await ImagePicker()
                        .pickImage(source: ImageSource.camera);
                    if (pickedImage != null) {
                      Navigator.pop(context);
                      setState(() {});
                    }
                  },
                ),
                ListTile(
                  title: const Text('From Gallery'),
                  leading: const Icon(Icons.browse_gallery),
                  onTap: () async {
                    pickedImage = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (pickedImage != null) {
                      Navigator.pop(context);
                      setState(() {});
                    }
                  },
                )
              ],
            ),
          );
        });
  }
}
