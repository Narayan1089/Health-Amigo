import 'package:amigoproject/app_screens/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:amigoproject/app_screens/reset_password.dart';
import 'package:amigoproject/services/initial_builder.dart';
import 'package:amigoproject/services/auth.dart';

class LogIn extends StatefulWidget {
  // final Function toggle;
  // LogIn(this.toggle);
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();

  void dispose() {
    emailText.dispose();
    passwordText.dispose();
    super.dispose();
  }

  String subLocal = '';
  String email = '';
  String password = '';
  bool isLoading = false;

  AuthMethods authMethods = AuthMethods();
  final _formKey = GlobalKey<FormState>();

  Future signMeIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      await authMethods
          .signInWithEmailAndPassword(emailText.text, passwordText.text)
          .then((value) {
        print(value);
        if (value != 'error') {
          email = emailText.text;
          password = passwordText.text;
          print('$email \n $password');
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Amigo()));
        } else {
          return 'error';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40.0),
        color: Colors.white,
        height: size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 70,
            ),
            Image(
              image: AssetImage('assets/images/Logo.png'),
              height: 102,
              width: 133,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Log in",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.normal,
                fontFamily: 'Lobster',
                color: Color(0xffFE834F),
              ),
            ),
            SizedBox(
              height: 36,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30.0),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black, width: 1.5),
//
                        ),
                        child: TextFormField(
                          validator: (value) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value.toString())
                                ? null
                                : 'Enter correct email';
                          },
                          controller: emailText,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(4),
                            enabledBorder: InputBorder.none,
//                        errorBorder: InputBorder.none,
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xffFF834F),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30.0),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black, width: 1.5),
                        ),
                        child: TextFormField(
                          validator: (value) {
                            return value.toString().length < 6
                                ? 'Enter Password 6+ characters'
                                : null;
                          },
                          controller: passwordText,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(4),
                            enabledBorder: InputBorder.none,
//                        errorBorder: InputBorder.none,
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffFF834F),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 30.0),
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ResetPassword()));
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 40,
                        width: 189,
                        margin: EdgeInsets.symmetric(horizontal: 70),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffFE834F),
                        ),
                        child: Center(
                          child: MaterialButton(
                            minWidth: double.infinity,
                            onPressed: () async {
                              var val = await signMeIn();
                              print(val);
                              if (val == 'error') {
                                print('error recieved');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      authMethods.errorMessage,
                                      style: TextStyle(
                                        color: Color(0xffFE834F),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Amigo()));
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Roboto',
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "New Here?",
                            style: TextStyle(
                                color: Color(0xffFF834F),
                                fontFamily: 'Montserrat',
                                fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Register()));
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: Color(0xffFF834F),
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
