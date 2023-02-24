import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/ui/widgets/screen_background_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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

