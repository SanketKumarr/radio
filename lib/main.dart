import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:radio_lnct/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Radio',
      debugShowCheckedModeBanner: false,
      home: MySplash(),
      // themeMode: ThemeMode.dark,
      // theme: ThemeData(
      //   // primaryColor: Color(0xff242a54),
      //
      // ),
    );
  }
}

class MyBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
