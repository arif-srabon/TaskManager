import 'package:flutter/material.dart';
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
        'Rabbil Hasan',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      subtitle: Text(
        'rabbil@gmail.com',
        style: TextStyle(color: Colors.white, fontSize: 13),
      ),
    );
  }
}
