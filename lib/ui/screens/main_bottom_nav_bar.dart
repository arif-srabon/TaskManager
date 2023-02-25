import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/add_new_task.dart';
import 'package:task_manager/ui/screens/cancelled_task_screen.dart';
import 'package:task_manager/ui/screens/completed_task_screen.dart';
import 'package:task_manager/ui/screens/new_task_screen.dart';
import 'package:task_manager/ui/screens/progress_task_screen.dart';
import 'package:task_manager/ui/widgets/user_profile_widget.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  int _selectedScreen = 0;
  final List<Widget> _screens = [
    NewTaskScreen(),
    ComplettedTaskScreen(),
    CancelledTaskScreen(),
    ProgressTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [UserProfile(), Expanded(child: _screens[_selectedScreen])],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddNewTaskScreen()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: Colors.green,
        onTap: (index) {
          _selectedScreen = index;
          setState(() {});
        },
        currentIndex: _selectedScreen,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.new_label_outlined), label: 'New'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_outline_rounded), label: 'Completed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.free_cancellation_rounded), label: 'Cancelled'),
          BottomNavigationBarItem(
              icon: Icon(Icons.incomplete_circle_outlined), label: 'Progress'),
        ],
      ),
    );
  }
}
