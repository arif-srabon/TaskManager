import 'package:flutter/material.dart';
import 'package:task_manager/data/network_utils.dart';
import 'package:task_manager/data/urls.dart';
import 'package:task_manager/main.dart';
import 'package:task_manager/ui/utils/snackbar_message.dart';
import 'package:task_manager/ui/widgets/app_elevated_button.dart';

showChangeTaskStatus(String currentStatus, String taskId,VoidCallback onChangedTask) {
  showModalBottomSheet(
      context: TaskManagerApp.globalKey.currentContext!,
      builder: (context) {
        String statusValue = currentStatus;
        return  StatefulBuilder(
            builder: (context, changeState) {
              return Column(
                children: [
                  RadioListTile(
                      value: 'New',
                      title: const Text('New'),
                      groupValue: statusValue,
                      onChanged: (state) {
                        statusValue = state!;
                        changeState(() {});
                      }
                  ),
                  RadioListTile(
                      value: 'Completed',
                      title: const Text('Completed'),
                      groupValue: statusValue,
                      onChanged: (state) {
                        statusValue = state!;
                        changeState(() {});
                      }
                  ),
                  RadioListTile(
                      value: 'Inprogress',
                      title: const Text('In progress'),
                      groupValue: statusValue,
                      onChanged: (state) {
                        statusValue = state!;
                        changeState(() {});
                      }
                  ),
                  RadioListTile(
                      value: 'Cancelled',
                      title: const Text('Cancelled'),
                      groupValue: statusValue,
                      onChanged: (state) {
                        statusValue = state!;
                        changeState(() {});
                      }
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: AppElevatedButton(child: const Text('Change Status'), onTap: () async{
                      final response = await networkData.getMethod(Urls.updateTaskStatus(taskId,statusValue));
                      if(response != null){
                        snackBarMessage(context, "Task Status Update Successfull");
                        Navigator.pop(context);
                        onChangedTask();
                      }else{
                        snackBarMessage(context, 'Status Change Failed! Please Try again',true);
                        Navigator.pop(context);
                      }
                    }),
                  )
                ],
              );
            }
        );
      });
}
