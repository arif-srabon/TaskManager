import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/screen_background_widget.dart';
import 'package:task_manager/ui/widgets/task_list_item.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({Key? key}) : super(key: key);

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenBackgroud(
        widget: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return TaskItemWidget(
                titleOfTask: 'Something',
                descriptionOfTask: 'Something',
                dateOfTask: 'Something',
                typeOfTask: 'In Progress',
                onEditPress: () {},
                onDeletePress: () {},
                chipBackgroundColor: Colors.grey,
              );
            }));
  }
}
