import 'package:flutter/material.dart';
import 'package:task_manager/data/models/new_tasks.dart';
import 'package:task_manager/data/models/task_status_count.dart';
import 'package:task_manager/data/network_utils.dart';
import 'package:task_manager/data/urls.dart';
import 'package:task_manager/ui/utils/alertDialog_widget.dart';
import 'package:task_manager/ui/utils/snackbar_message.dart';
import 'package:task_manager/ui/widgets/dashboard_item_widget.dart';
import 'package:task_manager/ui/widgets/screen_background_widget.dart';
import 'package:task_manager/ui/widgets/status_change_bottom_sheet.dart';
import 'package:task_manager/ui/widgets/task_list_item.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  TaskModel tasksList = new TaskModel();
  TaskCountModel taskCountData = new TaskCountModel();
  bool _inprogress = false;
  String totalNewTask = '0';
  String totalInprogressTask = '0';
  String totalCancelledTask = '0';
  String totalCompletedTask = '0';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewTasks();
    taskStatusCount();
  }

  Future<void> getNewTasks() async {
    _inprogress = true;
    setState(() {});
    final response = await networkData.getMethod(Urls.newTasksUrl);
    if (response != null) {
      tasksList = TaskModel.fromJson(response);
    } else {
      snackBarMessage(context, 'Faild to fetch new task', true);
    }
    _inprogress = false;
    setState(() {});
  }

  Future<void> taskStatusCount() async {
    _inprogress = true;
    setState(() {});
    final response = await networkData.getMethod(Urls.taskStatusCount);
    if (response != null) {
      taskCountData = TaskCountModel.fromJson(response);
      if(taskCountData.status == 'success'){
        taskCountData.data!.forEach((value) {
          if (value.sId == 'New') {
            totalNewTask = value.sum.toString();
          }else if(value.sId == 'Inprogress'){
            totalInprogressTask = value.sum.toString();
          }else if(value.sId == 'Cancelled'){
            totalCancelledTask = value.sum.toString();
          }else if(value.sId == 'Completed'){
            totalCompletedTask = value.sum.toString();
          }
          print(value);
        });
      }
    } else {
      snackBarMessage(context, 'Faild to fetch new task', true);
    }
    _inprogress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackgroud(
        widget: Column(
      children: [
        Row(
          children: [
            Expanded(
                child: DashboardItemCountWidget(
                    typeOfTask: 'New', numberOfTask: totalNewTask)),
            Expanded(
                child: DashboardItemCountWidget(
                    typeOfTask: 'Completed', numberOfTask: totalCompletedTask)),
            Expanded(
                child: DashboardItemCountWidget(
                    typeOfTask: 'Cancelled', numberOfTask: totalCancelledTask)),
            Expanded(
                child: DashboardItemCountWidget(
                    typeOfTask: 'In progress', numberOfTask: totalInprogressTask)),
          ],
        ),
        Expanded(
          child: (_inprogress)
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
                      descriptionOfTask:
                          tasksList.data?[index].description ?? '',
                      dateOfTask: tasksList.data?[index].createdDate ?? '',
                      typeOfTask: 'New',
                      onEditPress: () {
                       showChangeTaskStatus(
                           'New',
                           tasksList.data?[index].sId ?? '', () {
                           getNewTasks();
                       });
                      },
                      onDeletePress: () {
                        _confirmDelete(tasksList.data?[index].sId ?? '');
                        // deleteTask(tasksList.data?[index].sId ?? '');
                      },
                    );
                  }),
        ),
      ],
    ));
  }


  _confirmDelete(String taskId) {
    var baseDialog = BaseAlertDialog(
        title: "Confirm Delete",
        content: "Are you sure that you want to delte this record?",
        yesOnPressed: (){
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

  deleteTask(String taskId) async{
    final response = await networkData.getMethod(Urls.deleteTask(taskId));
    if(response != null){
      getNewTasks();
      snackBarMessage(context, "Task Deleted Successfull");
    }else{
      snackBarMessage(context, 'Task Deleted Failed! Please Try again',true);
    }
  }
}
