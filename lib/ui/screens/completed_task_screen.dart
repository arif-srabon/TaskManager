import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/screen_background_widget.dart';
import 'package:task_manager/ui/widgets/task_list_item.dart';

class ComplettedTaskScreen extends StatefulWidget {
  const ComplettedTaskScreen({Key? key}) : super(key: key);

  @override
  State<ComplettedTaskScreen> createState() => _ComplettedTaskScreenState();
}

class _ComplettedTaskScreenState extends State<ComplettedTaskScreen> {
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
                typeOfTask: 'Completed',
                onEditPress: () {},
                onDeletePress: () {},
                chipBackgroundColor: Colors.green,
              );
            }));
  }
}
