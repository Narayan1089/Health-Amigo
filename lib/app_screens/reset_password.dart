import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:amigoproject/app_screens/login.dart';
import 'package:amigoproject/services/auth.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPassword createState() => _ResetPassword();
}

class _ResetPassword extends State<ResetPassword> {
  TextEditingController resetEmailText = TextEditingController();
  bool isLoading = false;
  String email = '';
  final _formKey = GlobalKey<FormState>();

  AuthMethods authMethods = new AuthMethods();

  resetPass() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      authMethods.resetPassword(resetEmailText.text).then((value) {
        print('$value');
        email = resetEmailText.text;

        print("$email");
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 80.0),
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
              height: 40,
            ),
            Text(
              "Forgot Password",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.normal,
                fontFamily: 'Lobster',
                color: Color(0xffFE834F),
              ),
            ),
            SizedBox(
              height: 56,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30.0),
                      padding: EdgeInsets.all(10),
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
                        key: _formKey,
                        child: TextFormField(
                          validator: (value) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value.toString())
                                ? null
                                : 'Enter correct email';
                          },
                          controller: resetEmailText,
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
                    ),
                    SizedBox(
                      height: 50,
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
                            await resetPass();
                          },
                          child: Text(
                            "Send",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Roboto',
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30.0),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Back to Login",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
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
