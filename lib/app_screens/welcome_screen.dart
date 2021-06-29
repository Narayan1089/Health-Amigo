import 'package:amigoproject/app_screens/chat_screen.dart';
import 'package:amigoproject/app_screens/register.dart';
import 'package:flutter/material.dart';
import 'package:amigoproject/app_screens/login.dart';
import 'package:amigoproject/app_screens/chat_screen.dart';

class WelcomeScreen extends StatefulWidget {
  final Function toggle;
  WelcomeScreen(this.toggle);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isDoctor = false;

  @override
  Widget build(BuildContext context) {
    @override
    Size size = MediaQuery.of(context).size; // Size of device screen
    return Container(
      height: size.height,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hola, ",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontFamily: 'Lobster',
                  fontSize: 36,
                  letterSpacing: 0,
                  height: 1,
                ),
              ),
              Text(
                "Amigo !",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color(0xffFE834F),
                  fontFamily: 'Lobster',
                  fontSize: 36,
                  letterSpacing: 0,
                  height: 1,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Image(
            image: AssetImage('assets/images/Logo.png'),
            width: 228,
            height: 175,
          ),
          SizedBox(
            height: 110,
          ),
          Container(
            height: 59,
            width: 235,
            margin: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xffFE834F),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {
                  isDoctor = true;
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LogIn(widget.toggle)));
                },
                child: Text(
                  "Doctor",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Roboto',
                      fontSize: 25),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 11,
          ),
          Container(
            height: 59,
            width: 235,
            margin: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {
                  isDoctor = false;
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LogIn(widget.toggle)));
                },
                child: Text(
                  "Patient",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Roboto',
                      fontSize: 25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
