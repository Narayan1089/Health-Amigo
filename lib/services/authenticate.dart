import 'package:amigoproject/app_screens/login.dart';
import 'package:amigoproject/app_screens/register.dart';
import 'package:amigoproject/app_screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return WelcomeScreen(toggleView);
    } else {
      return Register(toggleView);
    }
  }
}
