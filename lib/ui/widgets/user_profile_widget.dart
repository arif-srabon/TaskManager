import 'package:flutter/material.dart';
import 'package:task_manager/data/auth_utils.dart';
import 'package:task_manager/ui/screens/login.dart';
import 'package:task_manager/ui/screens/update_profile_screen.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => UpdateProfileScreen()));
        },
        tileColor: Colors.green,
        leading: CircleAvatar(child: Icon(Icons.person_outlined)),
        title: Text(
          '${AuthUtils.firstName ?? 'First Name'} ${AuthUtils.lastName ?? 'Last Name'}',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        subtitle: Text(
          '${AuthUtils.email ?? 'test@gmail.com'}',
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
        trailing: IconButton(
          onPressed: () {
            AuthUtils.clearAuthData();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
          },
          icon: Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ));
  }
}
