import 'package:flutter/material.dart';
import 'package:task_manager/data/models/new_tasks.dart';
import 'package:task_manager/data/network_utils.dart';
import 'package:task_manager/data/urls.dart';
import 'package:task_manager/ui/utils/alertDialog_widget.dart';
import 'package:task_manager/ui/utils/snackbar_message.dart';
import 'package:task_manager/ui/widgets/screen_background_widget.dart';
import 'package:task_manager/ui/widgets/status_change_bottom_sheet.dart';
import 'package:task_manager/ui/widgets/task_list_item.dart';

class ComplettedTaskScreen extends StatefulWidget {
  const ComplettedTaskScreen({Key? key}) : super(key: key);

  @override
  State<ComplettedTaskScreen> createState() => _ComplettedTaskScreenState();
}

class _ComplettedTaskScreenState extends State<ComplettedTaskScreen> {
  TaskModel tasksList = new TaskModel();
  bool _inprogress = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTaskLists();
  }

  Future<void> getTaskLists() async {
    _inprogress = true;
    setState(() {});
    final response = await networkData.getMethod(Urls.completedTasksUrl);
    if (response != null) {
      tasksList = TaskModel.fromJson(response);
    } else {
      snackBarMessage(context, 'Faild to fetch completed task', true);
    }
    _inprogress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackgroud(
        widget: (_inprogress)
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              )
            : ListView.builder(
                itemCount: tasksList.data?.length,
                itemBuilder: (context, index) {
                  return TaskItemWidget(
                    titleOfTask: tasksList.data?[index].title ?? '',
                    descriptionOfTask: tasksList.data?[index].description ?? '',
                    dateOfTask: tasksList.data?[index].createdDate ?? '',
                    typeOfTask: 'Completd',
                    chipBackgroundColor: Colors.green,
                    onEditPress: () {
                      showChangeTaskStatus(
                          'Completed', tasksList.data?[index].sId ?? '', () {
                        getTaskLists();
                      });
                    },
                    onDeletePress: () {
                      _confirmDelete(tasksList.data?[index].sId ?? '');
                    },
                  );
                }));
  }

  _confirmDelete(String taskId) {
    var baseDialog = BaseAlertDialog(
        title: "Confirm Delete",
        content: "Are you sure that you want to delte this record?",
        yesOnPressed: () {
          deleteTask(taskId);
          Navigator.of(context, rootNavigator: true).pop();
        },
        noOnPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
        yes: "Yes confirm",
        no: "Cancel");
    showDialog(context: context, builder: (BuildContext context) => baseDialog);
  }

  deleteTask(String taskId) async {
    final response = await networkData.getMethod(Urls.deleteTask(taskId));
    if (response != null) {
      getTaskLists();
      snackBarMessage(context, "Task Deleted Successfull");
    } else {
      snackBarMessage(context, 'Task Deleted Failed! Please Try again', true);
    }
  }
}
