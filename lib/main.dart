import 'package:flutter/material.dart';
import 'package:amigoproject/app_screens/welcome_screen.dart';

// @dart = 2.9
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
//  Widget build(BuildContext context) {
//    return StreamProvider<User>.value(
//      value: AuthMethods().user,
//      child: MaterialApp(
//        debugShowCheckedModeBanner: false,
//        title: 'Amigo',
//        theme: ThemeData(
//          primarySwatch: Colors.orange,
//          visualDensity: VisualDensity.adaptivePlatformDensity,
//        ),
//        home: Wrapper(),
//      ),
//    );
//  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: WelcomeScreen(),
      ),
    );
  }
}
