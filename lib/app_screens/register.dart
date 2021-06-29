import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:amigoproject/services/auth.dart';
import 'package:amigoproject/services/initial_builder.dart';

class Register extends StatefulWidget {
  final Function toggle;
  Register(this.toggle);
  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
  TextEditingController emailTextReg = TextEditingController();
  TextEditingController passwordTextReg = TextEditingController();
  TextEditingController conPasswordTextReg = TextEditingController();
  TextEditingController nameTextReg = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  AuthMethods authMethods = AuthMethods();

  String email = '';
  String password = '';
  bool isLoading = false;

  Future signMeUp() async {
    var r = _formKey.currentState;
    if (r != null) {
      r.validate();
      setState(() {
        isLoading = true;
      });

      await authMethods
          .signUpWithEmailAndPassword(
              emailTextReg.text, passwordTextReg.text, nameTextReg.text)
          .then(
        (value) {
          print('$value');
          if (value != 'error') {
            email = emailTextReg.text;
            password = passwordTextReg.text;

            print('$email \n $password');
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Amigo()));
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
//            SizedBox(
//              height: 114,
//            ),
            Image(
              image: AssetImage('assets/images/Logo.png'),
              height: 102,
              width: 133,
            ),
            SizedBox(
              height: 25,
            ),
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
                      child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
                          validator: (value) {
//                            return RegExp(
//                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                                    .hasMatch(value.toString())
//                                ? null
//                                : 'Enter correct email';
                          },
                          controller: nameTextReg,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(4),
                            enabledBorder: InputBorder.none,
//                        errorBorder: InputBorder.none,
                            hintText: 'Name',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xffFF834F),
                            ),
                          ),
                        ),
                      ),
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
//                boxShadow: [
//                  BoxShadow(
//                    color: Color.fromRGBO(254, 131, 79, .3),
//                    blurRadius: 20,
//                    offset: Offset(0, 10),
//                  ),
                      ),
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
//                          validator: (value) {
//                            return RegExp(
//                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                                    .hasMatch(value.toString())
//                                ? null
//                                : 'Enter correct email';
//                          },
                          controller: emailTextReg,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(4),
                            enabledBorder: InputBorder.none,
//                        errorBorder: InputBorder.none,
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xffFF834F),
                            ),
                          ),
                        ),
                      ),
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
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
//                          validator: (value) {
//                            return value.toString().length < 6
//                                ? 'Enter Password 6+ characters'
//                                : null;
//                          },
                          controller: passwordTextReg,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(4),
                            enabledBorder: InputBorder.none,
//                        errorBorder: InputBorder.none,
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffFF834F),
                            ),
                          ),
                        ),
                      ),
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
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
//                          validator: (value) {
//                            return value != passwordTextReg.text
//                                ? 'Passwords do not match!'
//                                : null;
//                          },
                          controller: conPasswordTextReg,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(4),
                            enabledBorder: InputBorder.none,
//                        errorBorder: InputBorder.none,
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffFF834F),
                            ),
                          ),
                        ),
                      ),
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
                        child: TextButton(
                          onPressed: () async {
                            var val = await signMeUp();
                            print(val);
                            if (val == 'error') {
                              print('error recieved');
                              debugPrint(authMethods.errorMessage);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(authMethods.errorMessage),
                                ),
                              );
                            }
//                            Navigator.of(context).push(MaterialPageRoute(
//                                builder: (context) => Register(widget.toggle)));
                          },
                          child: Text(
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
            )
          ],
        ),
      ),
    );
  }
}
