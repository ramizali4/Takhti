import 'package:takhti_app/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/text_theme.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final tt = CustomTextTheme();
  final String svgString = 'assets/climbing.svg';
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
              // Image.asset('assets/climbing.png'),
              // show svg image here "assets/climbing.svg"
              SvgPicture.asset(
                svgString,
                //check mediaquery if screen width > 400 then image width = 200
                width: scr > 400 ? 500 : 250,
                height:  scr > 400 ? 500 : 250,
              ),
              SizedBox.fromSize(size: Size(0, 20)),
              Text(
                'Start your journey',
                style: tt.titleLargeBG,
                textAlign: TextAlign.center,
              ),
              SizedBox.fromSize(size: Size(0, 10)),
              Text(
                'Every big step start with a small step \n Note your first idea and start your journey!',
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