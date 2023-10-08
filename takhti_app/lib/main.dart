import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:takhti_app/landing_screens/intro.dart';
import 'package:takhti_app/landing_screens/login.dart';
import 'package:takhti_app/landing_screens/register.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  Future<String> checkFirst() async {
      return '/welcome';
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
              initialRoute: snapshot.data ?? '/login', // default to 'login' if null
              routes: {
                '/welcome': (context) => const OnBoardingPage(),
                '/login': (context) => const LoginScreen(),
                '/register': (context) => const RegisterScreen(),
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
