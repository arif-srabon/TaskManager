import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/data/auth_utils.dart';
import 'package:task_manager/ui/screens/login.dart';
import 'package:task_manager/ui/screens/main_bottom_nav_bar.dart';
import 'package:task_manager/ui/widgets/screen_background_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      checkAuthState();
    });
  }

  void checkAuthState() async {
    final bool isLogin = await AuthUtils.checkLoginState();
    if (isLogin) {
      await AuthUtils.getAuthData();
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) => MainBottomNavBarScreen(),
      ), (route) => false);

    } else {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ), (route) => false);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenBackgroud(
      widget: Center(
        child: SvgPicture.asset(
          'assets/images/logo.svg',
          width: 200,
          fit: BoxFit.scaleDown,
        ),
      ),
    ));
  }
}
