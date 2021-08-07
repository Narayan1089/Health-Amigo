import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

User? loggedInUser;

class AccountDetails extends StatelessWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    loggedInUser = _auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Account Details',
          style: TextStyle(
            // fontSize: 36,
            // fontWeight: FontWeight.normal,
            // fontFamily: 'Lobster',
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        // alignment: AlignmentGeometry.lerp(a, b, t),
        margin: EdgeInsets.fromLTRB(13, 30, 13, 0),
        width: 400,
        height: 220,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
            color: Color(0xffE5E5E5), borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 10,
            // ),
            Text(
              'Account Details',
              style: TextStyle(
                  // color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.normal,
                  fontSize: MediaQuery.of(context).size.width * 0.04),
            ),
            SizedBox(
              height: 33,
            ),
            Text(
              'Name: ' + loggedInUser!.displayName.toString(),
              style: TextStyle(
                  // color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: MediaQuery.of(context).size.width * 0.035),
            ),
            Text(
              'Email: ' + loggedInUser!.email.toString(),
              style: TextStyle(
                  // color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: MediaQuery.of(context).size.width * 0.035),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
