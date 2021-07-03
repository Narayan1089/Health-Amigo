import 'package:flutter/material.dart';

class SOS extends StatelessWidget {
  const SOS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 135,
              ),
              Text(
                'Are you currently in a\nstate of emergency?',
                style: TextStyle(
                  color: Color(0xff4B4C4D),
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Image.asset(
                'assets/images/Sos.png',
                width: 188,
                height: 188,
              ),
              SizedBox(
                height: 160,
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
                    onPressed: () {},
                    child: Text(
                      "Yes",
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
              SizedBox(
                height: 30,
              ),
              Container(
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'No, I\'m fine',
                      style: TextStyle(
                          color: Color(0xff4B4C4D),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 17),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
