import 'package:flutter/material.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
    required this.titleOfTask,
    required this.descriptionOfTask,
    required this.dateOfTask,
    required this.typeOfTask,
    required this.onEditPress,
    required this.onDeletePress,
  });

  final String titleOfTask;
  final String descriptionOfTask;
  final String dateOfTask;
  final String typeOfTask;
  final VoidCallback onEditPress, onDeletePress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Card(
            elevation: 5,
            margin: EdgeInsets.all(5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleOfTask,
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    descriptionOfTask,
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Date: $dateOfTask',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Chip(
                        label: Text(
                          typeOfTask,
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: onEditPress,
                          icon: Icon(
                            Icons.edit,
                            color: Colors.green,
                          )),
                      IconButton(
                          onPressed: onDeletePress,
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
