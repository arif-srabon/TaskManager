import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/screen_background_widget.dart';
import 'package:task_manager/ui/widgets/task_list_item.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({Key? key}) : super(key: key);

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
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
                typeOfTask: 'Cancelled',
                onEditPress: () {},
                onDeletePress: () {},
                chipBackgroundColor: Colors.red,
              );
            }));
  }
}
