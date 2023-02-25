import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/dashboard_item_widget.dart';
import 'package:task_manager/ui/widgets/screen_background_widget.dart';
import 'package:task_manager/ui/widgets/task_list_item.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenBackgroud(
        widget: Column(
      children: [
        Row(
          children: [
            Expanded(
                child: DashboardItemCountWidget(
                    typeOfTask: 'New', numberOfTask: '12')),
            Expanded(
                child: DashboardItemCountWidget(
                    typeOfTask: 'Completed', numberOfTask: '12')),
            Expanded(
                child: DashboardItemCountWidget(
                    typeOfTask: 'Cancelled', numberOfTask: '12')),
            Expanded(
                child: DashboardItemCountWidget(
                    typeOfTask: 'In progress', numberOfTask: '12')),
          ],
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return TaskItemWidget(
                  titleOfTask: 'Something',
                  descriptionOfTask: 'Something',
                  dateOfTask: 'Something',
                  typeOfTask: 'New',
                  onEditPress: () {},
                  onDeletePress: () {},
                );
              }),
        ),
      ],
    ));
  }
}

