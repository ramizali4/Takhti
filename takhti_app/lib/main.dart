import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:takhti_app/landing_screens/intro.dart';
import 'package:takhti_app/mainscreens/NavigationScr.dart';
import 'package:takhti_app/landing_screens/login.dart';
import 'package:takhti_app/landing_screens/register.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takhti_app/mainscreens/notesScreens/simpleNote.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'mainscreens/notesScreens/checklist.dart';
import 'mainscreens/notesScreens/subchecklist.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String> checkFirst() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.getBool('first_time') == null) {
      print('first time');
      prefs.setBool('first_time', false);
      return '/welcome';
    } else {
      return '/login';
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return FutureBuilder<String>(
      future: checkFirst(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ProviderScope(
            child: MaterialApp(
              title: 'Introduction screen',
              debugShowCheckedModeBanner: false,
              // initialRoute: '/newNote',
              initialRoute:
                  snapshot.data ?? '/login', // default to 'login' if null
              routes: {
                '/welcome': (context) => const OnBoardingPage(),
                '/login': (context) => const LoginScreen(),
                '/register': (context) => const RegisterScreen(),
                '/my_home_page': (context) => MyHomePage(),
                '/editNote': (context) => NotePage(
                      noteId: null,
                    ),
                '/editChecklist': (context) => DynamicChecklist(),
                '/editSubChecklist': (context) => DynamicSubChecklist(),
              },
            ),
          );
        } else {
          return CircularProgressIndicator(); // or any other loading indicator
        }
      },
    );
  }
}
