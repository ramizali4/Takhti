import 'package:takhti_app/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:takhti_app/mainscreens/Home.dart';
import 'package:takhti_app/mainscreens/FinishedTasks.dart';
import 'package:takhti_app/mainscreens/Search.dart';
import 'package:takhti_app/mainscreens/Settings.dart';
import 'custom_widgets/new_items_tile.dart';

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
            showModalBottomSheet<void>(
              context: bCnt,
              isScrollControlled: true,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(bCnt).size.height*0.70,
                maxWidth: MediaQuery.of(bCnt).size.width>=500?500:MediaQuery.of(bCnt).size.width,
              ),
              builder: (BuildContext context) {
                return Container(
                    height: MediaQuery.of(context).size.height*1.2,
                    //rounded top corners
                    decoration: const BoxDecoration(
                        color: AppColorsLight.bgColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        )
                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('What do you want to note',style: tt.titleLrg,),
                              IconButton(onPressed: _closeModal, icon: Icon(Icons.close)),
                            ],
                          ),
                          SizedBox.fromSize(size: Size(2,5)),
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children:  [
                                NewItemsTile(
                                    tt: tt,
                                    icon: Icons.lightbulb_outline_rounded,
                                    title: 'Interesting Idea',
                                    subtitle: 'Use free text area, feel free to write it all',
                                    bg: const Color.fromRGBO(156,127,197, 1),
                                    iconbg: const Color.fromRGBO(72, 52, 99, 1),
                                    ontap: (){
                                      Navigator.pushNamed(context, '/editNote');
                                    }
                                ),
                                NewItemsTile(
                                    tt: tt,
                                    icon: Icons.shopping_cart_outlined,
                                    title: 'Buying Something',
                                    subtitle: 'Use checklist, so you won’t miss anything',
                                    bg: const Color.fromRGBO(88,194,118, 1),
                                    iconbg: const Color.fromRGBO(27,134,63, 1),
                                    ontap: (){
                                      Navigator.pushNamed(context, '/editChecklist');
                                    }
                                ),
                                NewItemsTile(
                                  tt: tt,
                                  icon: Icons.golf_course_outlined,
                                  title: 'Goals',
                                  subtitle: 'Near/future goals, notes and keep focus',
                                  bg: const Color.fromRGBO(230,208,76, 1),
                                  iconbg: const Color.fromRGBO(121,99,18, 1),
                                  ontap: () => print('goals'),
                                ),
                                NewItemsTile(
                                  tt: tt,
                                  icon: Icons.grading_outlined,
                                  title: 'Guidance',
                                  subtitle: 'Create guidance for routine activities',
                                  bg: const Color.fromRGBO(209,75,99, 1),
                                  iconbg: const Color.fromRGBO(115,19,30, 1),
                                  ontap: () => print('Guide'),
                                ),
                                NewItemsTile(
                                    tt: tt,
                                    icon: Icons.task_outlined,
                                    title: 'Routine Tasks',
                                    subtitle: 'Checklist with sub-checklist',
                                    bg: const Color.fromRGBO(211,209,91, 1),
                                    iconbg: const Color.fromRGBO(107,106,50, 1),
                                    ontap: (){
                                      Navigator.pushNamed(context, '/editSubChecklist');
                                    }
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                );
              },
            );
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




