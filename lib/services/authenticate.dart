import 'package:amigoproject/app_screens/login.dart';
import 'package:amigoproject/services/initial_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  // bool showSignIn = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // void toggleView() {
  //   setState(() {
  //     showSignIn = !showSignIn;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return Amigo();
    } else {
      return LogIn();
    }
  }
}
