import 'package:flutter/material.dart';
import 'package:task_manager/data/models/new_tasks.dart';
import 'package:task_manager/data/network_utils.dart';
import 'package:task_manager/data/urls.dart';
import 'package:task_manager/ui/utils/snackbar_message.dart';
import 'package:task_manager/ui/widgets/app_elevated_button.dart';
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
  bool _inprogress = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewTasks();
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
                        deleteTask(tasksList.data?[index].sId ?? '');
                      },
                    );
                  }),
        ),
      ],
    ));
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
