import 'package:flutter/material.dart';
import 'package:task_manager/data/models/new_tasks.dart';
import 'package:task_manager/data/network_utils.dart';
import 'package:task_manager/data/urls.dart';
import 'package:task_manager/ui/utils/snackbar_message.dart';
import 'package:task_manager/ui/widgets/screen_background_widget.dart';
import 'package:task_manager/ui/widgets/status_change_bottom_sheet.dart';
import 'package:task_manager/ui/widgets/task_list_item.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({Key? key}) : super(key: key);

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
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
    final response = await networkData.getMethod(Urls.inprogressTasksUrl);
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
        widget:  (_inprogress) ? Center(child: CircularProgressIndicator(color:Colors.green,),) :  ListView.builder(
            itemCount: tasksList.data?.length,
            itemBuilder: (context, index) {
              return TaskItemWidget(
                titleOfTask: tasksList.data?[index].title ?? '',
                descriptionOfTask:  tasksList.data?[index].description ?? '',
                dateOfTask:  tasksList.data?[index].createdDate ?? '',
                typeOfTask: 'In Progress',
                onEditPress: () {
                  showChangeTaskStatus(
                      'Inprogress',
                      tasksList.data?[index].sId ?? '', () {
                      getTaskLists();
                  });
                },
                onDeletePress: () {},
                chipBackgroundColor: Colors.grey,
              );
            }));
  }
}
