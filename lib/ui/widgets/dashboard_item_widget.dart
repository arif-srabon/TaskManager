import 'package:flutter/material.dart';

class DashboardItemCountWidget extends StatelessWidget {
  const DashboardItemCountWidget({
    super.key, required this.numberOfTask, required this.typeOfTask,
  });
  final String numberOfTask;
  final String typeOfTask;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              numberOfTask,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8,),
            FittedBox(child: Text(typeOfTask))
          ],
        ),
      ),
    );
  }
}
