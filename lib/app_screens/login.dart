import 'package:amigoproject/app_screens/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:amigoproject/app_screens/reset_password.dart';
import 'package:amigoproject/services/initial_builder.dart';
import 'package:amigoproject/services/auth.dart';

class LogIn extends StatefulWidget {
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
  bool _isObscure = true;

  AuthMethods authMethods = AuthMethods();
  final _formKey = GlobalKey<FormState>();

  Future<dynamic> signMeIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      await authMethods
          .signInWithEmailAndPassword(emailText.text, passwordText.text)
          .then((value) {
        // print(value);
        if (value != 'error' && authMethods.e == false) {
          email = emailText.text;
          password = passwordText.text;
          // print('$email \n $password');
          debugPrint('Email: ' + email + " " + "Password: " + password);
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
      body: SingleChildScrollView(
        child: Container(
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
                // child: SingleChildScrollView(
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
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
                          obscureText: _isObscure,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            return value.toString().length < 6
                                ? 'Enter Password 6+ characters'
                                : null;
                          },
                          controller: passwordText,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color(0xffFF834F),
                              ),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(4),
                            enabledBorder: InputBorder.none,
                            //                        errorBorder: InputBorder.none,
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontSize: 17,
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
                              // if (await Vibration.hasVibrator()) {
                              //   Vibration.vibrate(
                              //       amplitude: 128, duration: 1000);
                              // } else {
                              //   debugPrint('NO Vibration');
                              // }
                              await signMeIn();
                              // print("Login: $val");
                              if (authMethods.e) {
                                setState(() {
                                  isLoading = false;
                                });
                                print('error recieved: ' +
                                    authMethods.e.toString());
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Color(0xffFE834F),
                                    content: Text(
                                      authMethods.errorMessage,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                                authMethods.e = false;
                              }
                            },
                            child: isLoading
                                ? CupertinoActivityIndicator()
                                : Text(
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
              // )
            ],
          ),
        ),
      ),
    );
  }
}
