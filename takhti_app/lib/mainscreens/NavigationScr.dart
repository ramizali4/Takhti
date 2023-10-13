import 'package:takhti_app/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:takhti_app/mainscreens/Home.dart';
import 'package:takhti_app/mainscreens/FinishedTasks.dart';
import 'package:takhti_app/mainscreens/Search.dart';
import 'package:takhti_app/mainscreens/Settings.dart';

import '../theme/text_theme.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      _selectedIndex = index;
      setState(() {});
    }
  }
  final _controller =
      PersistentTabController(initialIndex: 0);


  @override
  Widget build(BuildContext context) {
    final bCnt  = context;
    final tt = CustomTextTheme();
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildscreens(bCnt),
      backgroundColor: Colors.white,
      navBarHeight: 60,
      navBarStyle: NavBarStyle.style15,
      items: <PersistentBottomNavBarItem>[
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          title: ("Home"),
          activeColorPrimary: AppColorsDark.primaryBlack,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.checklist),
          title: ("Finished"),
          activeColorPrimary: AppColorsDark.primaryBlack,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.add,color: Colors.white,),
          activeColorPrimary: AppColorsDark.primaryBlack,
          inactiveColorPrimary: AppColorsDark.primaryBlack,
          onPressed: (context){

          },
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.search),
          title: ("Search"),
          activeColorPrimary: AppColorsDark.primaryBlack,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.settings),
          title: ("Settings"),
          activeColorPrimary: AppColorsDark.primaryBlack,
          inactiveColorPrimary: Colors.grey,
        ),
      ],
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0.0),
        colorBehindNavBar: Colors.white,
      ),
    );
  }
  void _closeModal(){
    Navigator.of(context).pop();
  }

  List<Widget> _buildscreens(BuildContext bCnt) {
    return [
      Screen1(),
      Screen2(),
      Text('3'),
      Screen4(),
      Screen5(bCnt),
    ];
  }
}




