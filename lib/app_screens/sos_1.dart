// import 'dart:async';

// import 'package:amigoproject/app_screens/home_page.dart';
// import 'package:amigoproject/services/initial_builder.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SOS1 extends StatefulWidget {
  const SOS1({Key? key}) : super(key: key);

  @override
  _SOS1State createState() => _SOS1State();
}

class _SOS1State extends State<SOS1> {
  late Timer _timer;
  int _start = 5;
  bool timerClose = true;

  // bool timeDispose = false;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      timerClose ? launch(('tel://9876543210')) : print("SOS Cancelled");
      _timer.cancel();
      // dispose();
      // 5 seconds over, navigate to Page2.

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (_) => AfterSoS(),
      //     ));
    });

    return Container(
      color: Color(0xffFF834A),
      child: Center(
        child: Container(
          width: 352,
          height: 378,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.22),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'This call will start automatically in',
                style: TextStyle(
                  color: Color(0xff4B4C4D),
                  decoration: TextDecoration.none,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 13.82,
                  fontStyle: FontStyle.normal,
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),

              Text(
                '$_start',
                //   Timer.periodic(Duration(seconds: 5), (timer) {
                //   print(DateTime.now());
                // });
                style: TextStyle(
                  color: Color(0xffFF834F),
                  decoration: TextDecoration.none,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                  fontSize: 90.43,
                  fontStyle: FontStyle.normal,
                ),
              ),
              Text(
                'SECONDS',
                style: TextStyle(
                  color: Color(0xff4B4C4D),
                  decoration: TextDecoration.none,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 14.47,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Caller Name: John Doe',
                style: TextStyle(
                  color: Color(0xff4B4C4D),
                  decoration: TextDecoration.none,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 9.47,
                  fontStyle: FontStyle.normal,
                ),
              ),
              Text(
                'Affiliation: State Mental Health Helpline',
                style: TextStyle(
                  color: Color(0xff4B4C4D),
                  decoration: TextDecoration.none,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 9.47,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 45,
                width: 128,
                // height: 59,
                // width: 235,
                margin: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xff4B4C4D),
                  // border: Border.all(color: Color(4B4C4D), width: 2),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        timerClose = false;
                      });
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (_) => AfterSoS(),
                      //     ));
                      Navigator.pop(context);
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Amigo()));
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 17),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
