import 'package:amigoproject/app_screens/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:amigoproject/services/auth.dart';
import 'package:amigoproject/services/authenticate.dart';

class PhoneScreen extends StatefulWidget {
  final String email;
  final String password;
  PhoneScreen(this.email, this.password);

  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  TextEditingController phoneNumber = TextEditingController();
  AuthMethods authMethods = AuthMethods();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

//  Future phoneVerify() async {
//    if (_formKey.currentState!.validate()) {
//      setState(() {
//        isLoading = true;
//      });
//    }
//    await authMethods
//        .phoneVerification(widget.email, widget.password, phoneNumber.text)
//        .then((value) {
//      print(value);
//      if (value != 'error') {
//        print('Error');
//      } else {
//        ScaffoldMessenger.of(context).showSnackBar(
//          SnackBar(
//            content: Text(
//              'Unable to verify Phone number!',
//              style: TextStyle(
//                color: Color(0xffFE834F),
//              ),
//            ),
//          ),
//        );
//      }
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(top: 40),
        child: Container(
          margin: EdgeInsets.only(top: 40.0),
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Text(
                "Let's verify your identity!",
                style: TextStyle(fontFamily: 'Poppins', fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(right: 40.0, left: 40.0),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Color(0xFF000000).withOpacity(0.6),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 50),
                child: Text(
                  "Enter your Mobile Number",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Color(0xFF000000).withOpacity(0.6),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 50.0),
                      decoration: BoxDecoration(
                        color: Color(0xffF7F5F6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffC4C4C4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                '+91',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              validator: (value) {
                                return RegExp(r"^[0-9]")
                                        .hasMatch(value.toString())
                                    ? null
                                    : 'Enter correct email';
                              },
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(4),
                                enabledBorder: InputBorder.none,
//                        errorBorder: InputBorder.none,
                                hintText: ' Phone Number',
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
//                    height: 40,
//            width: 189,
                      margin: EdgeInsets.symmetric(horizontal: 70),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffFE834F),
                      ),
                      child: Center(
                        child: MaterialButton(
                          minWidth: double.infinity,
                          onPressed: () {
//                  var val = await signMeIn();
//                  print(val);
//                  if (val == 'error') {
//                    print('error recieved');
//                    ScaffoldMessenger.of(context).showSnackBar(
//                      SnackBar(
//                        content: Text(
//                          authMethods.errorMessage,
//                          style: TextStyle(
//                            color: Color(0xffFE834F),
//                          ),
//                        ),
//                      ),
//                    );
//                  }
//                              Navigator.of(context).push(MaterialPageRoute(
//                                  builder: (context) => Register(toggle)));
                          },
                          child: Text(
                            "Send OTP",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Roboto',
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
