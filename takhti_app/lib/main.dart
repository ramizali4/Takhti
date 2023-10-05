import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent,statusBarIconBrightness: Brightness.light),
    );

    return const ProviderScope(
      child: MaterialApp(
        title: 'Introduction screen',
        debugShowCheckedModeBanner: false,
        routes: {
        },
      ),
    );
  }
}
