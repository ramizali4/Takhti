import 'package:takhti_app/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/text_theme.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final tt = CustomTextTheme();
  final String svgString = 'assets\\foresight.svg';
  late double scr;
  @override
  Widget build(BuildContext context) {
    scr = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColorsLight.bgColor,
      //show an image climbing.png in center and text below image saying "lets start your jouney"
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgString,
                //check mediaquery if screen width > 400 then image width = 200
                width: scr > 400 ? 500 : 250,
                height:  scr > 400 ? 500 : 250,
              ),
              SizedBox.fromSize(size: Size(0, 20)),
              Text(
                'No Finished Notes Yet',
                style: tt.titleLargeBG,
                textAlign: TextAlign.center,
              ),
              SizedBox.fromSize(size: Size(0, 10)),
              Text(
                'Once you create a note and finish it,\nit will be appeared on this screen.\nSo, let’s start your journey!',
                style: tt.bodyBG,
                textAlign: TextAlign.center,
              ),
              SizedBox.fromSize(size: Size(0, 10)),
            ],
          ),
        ),
      ),
    );
  }
}