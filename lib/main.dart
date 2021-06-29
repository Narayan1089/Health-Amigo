// @dart = 2.9
import 'package:amigoproject/services/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:amigoproject/app_screens/welcome_screen.dart';
import 'package:amigoproject/services/authenticate.dart';

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
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Column(
                  children: [Icon(Icons.error), Text("Something went wrong")],
                ),
              ),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            home: Scaffold(
              body: Authenticate(),
            ),
          );
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Center(
          child: CircularProgressIndicator(),
        )),
      ),
    );
  }
}
