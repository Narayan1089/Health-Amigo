import 'package:amigoproject/app_screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:amigoproject/services/auth.dart';
// import 'package:amigoproject/app_screens/phoneNumberScreen.dart';

class Register extends StatefulWidget {
  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
  TextEditingController emailTextReg = TextEditingController();
  TextEditingController passwordTextReg = TextEditingController();
  TextEditingController conPasswordTextReg = TextEditingController();
  TextEditingController firstnameTextReg = TextEditingController();
  TextEditingController lastnameTextReg = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  AuthMethods authMethods = AuthMethods();

  String email = '';
  String password = '';
  String name = '';
  bool isLoading = false;
  bool _isObscure = true;
  bool _isObscure1 = true;

  Future signMeUp() async {
    // var r = ;
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      name = firstnameTextReg.text + " " + lastnameTextReg.text;
      debugPrint("Name: " + name.toString());

      await authMethods
          .signUpWithEmailAndPassword(
              emailTextReg.text, passwordTextReg.text, name)
          .then(
        (value) {
          print('$value');
          if (value != 'error') {
            email = emailTextReg.text;
            password = passwordTextReg.text;

            print('$email \n $password');
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LogIn()));
          } else {
            return 'error';
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30.0),
        color: Colors.white,
        height: size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            // Image(
            //   image: AssetImage('assets/images/Logo.png'),
            //   height: 102,
            //   width: 133,
            // ),
            // SizedBox(
            //   height: 25,
            // ),
            Text(
              "Register",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.normal,
                fontFamily: 'Lobster',
                color: Color(0xffFE834F),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black, width: 1.5),
                        ),
                        // child: Form(
                        //   key: _formKey,
                        //   autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
                          validator: (value) {
                            return value.toString().length < 3 ||
                                    value.toString().length > 10
                                ? 'Enter a valid name having 3 - 10 characters'
                                : null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: firstnameTextReg,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(4),
                            enabledBorder: InputBorder.none,
                            //                        errorBorder: InputBorder.none,
                            labelText: 'First Name',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xffFF834F),
                            ),
                          ),
                        ),
                        // ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black, width: 1.5),
                        ),
                        // child: Form(
                        //   key: _formKey,
                        //   autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
                          validator: (value) {
                            return value.toString().length < 3 ||
                                    value.toString().length > 10
                                ? 'Enter a valid name having 3 - 10 characters'
                                : null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: lastnameTextReg,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(4),
                            enabledBorder: InputBorder.none,
                            //                        errorBorder: InputBorder.none,
                            labelText: 'Last Name',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xffFF834F),
                            ),
                          ),
                        ),
                        // ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black, width: 1.5),
                        ),
                        child: TextFormField(
                          validator: (value) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value.toString())
                                ? null
                                : 'Enter correct email';
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: emailTextReg,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(4),
                            enabledBorder: InputBorder.none,
                            //                        errorBorder: InputBorder.none,
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xffFF834F),
                            ),
                          ),
                        ),
                        // ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black, width: 1.5),
                        ),
                        // child: Form(
                        //   autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
                          obscureText: _isObscure,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            return value.toString().length < 6
                                ? 'Enter Password 6+ characters'
                                : null;
                          },
                          controller: passwordTextReg,
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
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffFF834F),
                            ),
                          ),
                        ),
                        // ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black, width: 1.5),
                        ),
                        // child: Form(
                        //   autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
                          obscureText: _isObscure1,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            return value != passwordTextReg.text
                                ? 'Passwords do not match!'
                                : null;
                          },
                          controller: conPasswordTextReg,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObscure1 = !_isObscure1;
                                });
                              },
                              icon: Icon(
                                _isObscure1
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color(0xffFF834F),
                              ),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(4),
                            enabledBorder: InputBorder.none,
                            //                        errorBorder: InputBorder.none,
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffFF834F),
                            ),
                          ),
                        ),
                        // ),
                      ),
                      SizedBox(
                        height: 15,
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
                            onPressed: () async {
                              await signMeUp();
                              if (authMethods.e) {
                                setState(() {
                                  isLoading = false;
                                });
                                print('error recieved');
                                debugPrint(authMethods.errorMessage);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Color(0xffFE834F),
                                    duration: Duration(seconds: 1),
                                    content: Text(
                                      authMethods.errorMessage,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => LogIn()
                              // PhoneScreen(
                              //     emailTextReg.text, passwordTextReg.text)
                              // ));
                            },
                            child: isLoading
                                ? CupertinoActivityIndicator()
                                : Text(
                                    "Register",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Roboto',
                                        fontSize: 16),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Already have an Account?",
                        style: TextStyle(
                            color: Color(0xffFF834F),
                            fontFamily: 'Montserrat',
                            fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          //                        Navigator.of(context).push(MaterialPageRoute(
                          //                            builder: (context) => LogIn(widget.toggle)));
                        },
                        child: Text(
                          "Click Here",
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
