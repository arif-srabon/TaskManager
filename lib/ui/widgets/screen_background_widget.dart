import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenBackgroud extends StatelessWidget {
  final Widget widget;
  const ScreenBackgroud({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/images/background.svg',
          fit: BoxFit.cover,
          width: screensize.width,
          height: screensize.height,
        ),
        widget
      ],
    );
  }
}
