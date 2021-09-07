// // import 'package:amigoproject/app_screens/register.dart';
// import 'dart:async';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:amigoproject/services/auth.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/otp_field_style.dart';
// import 'package:otp_text_field/style.dart';
// // import 'package:amigoproject/services/authenticate.dart';

// enum MobileVerificationState {
//   SHOW_MOBILE_FORM_STATE,
//   SHOW_OTP_FORM_STATE,
// }

// class PhoneScreen extends StatefulWidget {
//   final String email;
//   final String password;
//   PhoneScreen(this.email, this.password);

//   @override
//   _PhoneScreenState createState() => _PhoneScreenState();
// }

// class _PhoneScreenState extends State<PhoneScreen> {
//   MobileVerificationState currentState =
//       MobileVerificationState.SHOW_MOBILE_FORM_STATE;

//   int start = 60;
//   bool wait = false;
//   String buttonName = "Send";
//   TextEditingController phoneController = TextEditingController();
//   // AuthClass authClass = AuthClass();
//   String verificationIdFinal = "";
//   String smsCode = "";

//   // TextEditingController phoneController = TextEditingController();
//   // TextEditingController otpController = TextEditingController();
//   // final phoneController = TextEditingController();
//   // final otpController = TextEditingController();

//   AuthMethods authMethods = AuthMethods();
//   final _formKey = GlobalKey<FormState>();
//   bool isLoading = false;

// //  Future phoneVerify() async {
// //    if (_formKey.currentState!.validate()) {
// //      setState(() {
// //        isLoading = true;
// //      });
// //    }
// //    await authMethods
// //        .phoneVerification(widget.email, widget.password, phoneNumber.text)
// //        .then((value) {
// //      print(value);
// //      if (value != 'error') {
// //        print('Error');
// //      } else {
// //        ScaffoldMessenger.of(context).showSnackBar(
// //          SnackBar(
// //            content: Text(
// //              'Unable to verify Phone number!',
// //              style: TextStyle(
// //                color: Color(0xffFE834F),
// //              ),
// //            ),
// //          ),
// //        );
// //      }
// //    });
// //  }

//   getMobileFormWidget(context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 40.0),
//             decoration: BoxDecoration(
//               color: Color(0xffF7F5F6),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Color(0xffC4C4C4),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.all(15.0),
//                     child: Text(
//                       '+91',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontFamily: 'Poppins',
//                         fontSize: 12,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Flexible(
//                   child: TextFormField(
//                     validator: (value) {
//                       return RegExp(r"^[0-9]").hasMatch(value.toString())
//                           ? null
//                           : 'Enter correct Phone number';
//                     },
//                     controller: phoneController,
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.all(4),
//                       enabledBorder: InputBorder.none,
// //                        errorBorder: InputBorder.none,
//                       hintText: ' Phone Number',
//                       hintStyle: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 40,
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 70),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Color(0xffFE834F),
//             ),
//             child: Center(
//               child: MaterialButton(
//                 minWidth: double.infinity,
//                 onPressed: () {
//                   setState(() {
//                     start = 60;
//                     wait = true;
//                     buttonName = "Resend Verfication Code";
//                     currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
//                   });
//                 },
//                 child: Text(
//                   "Send OTP",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.normal,
//                       fontFamily: 'Roboto',
//                       fontSize: 20),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   getOtpFormWidget(context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           OTPTextField(
//             length: 6,
//             width: MediaQuery.of(context).size.width - 44,
//             fieldWidth: 38,
//             otpFieldStyle: OtpFieldStyle(
//               backgroundColor: Color(0xffF7F5F6),
//               borderColor: Colors.black,
//             ),
//             style: TextStyle(fontSize: 12, color: Colors.black),
//             textFieldAlignment: MainAxisAlignment.spaceAround,
//             fieldStyle: FieldStyle.box,
//             onCompleted: (pin) {
//               print("Completed: " + pin);
//               setState(() {
//                 smsCode = pin;
//               });
//             },
//           ),
//           SizedBox(
//             height: 40,
//           ),
//           RichText(
//               text: TextSpan(
//             children: [
//               TextSpan(
//                 text: "Code would expire in ",
//                 style: TextStyle(fontSize: 16, color: Colors.black38),
//               ),
//               TextSpan(
//                 text: "00:$start",
//                 style: TextStyle(fontSize: 16, color: Colors.black87),
//               ),
//               TextSpan(
//                 text: " seconds ",
//                 style: TextStyle(fontSize: 16, color: Colors.black38),
//               ),
//             ],
//           )),

// //           Container(
// //             margin: EdgeInsets.symmetric(horizontal: 40.0),
// //             decoration: BoxDecoration(
// //               color: Color(0xffF7F5F6),
// //               borderRadius: BorderRadius.circular(10),
// //             ),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.start,
// //               children: [
// //                 Container(
// //                   decoration: BoxDecoration(
// //                     color: Color(0xffC4C4C4),
// //                     borderRadius: BorderRadius.circular(10),
// //                   ),
// //                   child: Padding(
// //                     padding: EdgeInsets.all(15.0),
// //                     child: Text(
// //                       '->',
// //                       style: TextStyle(
// //                         color: Colors.white,
// //                         fontFamily: 'Poppins',
// //                         fontSize: 12,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 Flexible(
// //                   child: TextFormField(
// //                     validator: (value) {
// //                       return RegExp(r"^[0-9]").hasMatch(value.toString())
// //                           ? null
// //                           : 'Enter correct Phone number';
// //                     },
// //                     controller: otpController,
// //                     keyboardType: TextInputType.number,
// //                     decoration: const InputDecoration(
// //                       border: InputBorder.none,
// //                       contentPadding: EdgeInsets.all(4),
// //                       enabledBorder: InputBorder.none,
// // //                        errorBorder: InputBorder.none,
// //                       hintText: ' OTP',
// //                       hintStyle: TextStyle(
// //                         fontSize: 12,
// //                         fontWeight: FontWeight.bold,
// //                         color: Colors.grey,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
//           SizedBox(
//             height: 40,
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 50),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Color(0xffFE834F),
//             ),
//             child: Center(
//               child: MaterialButton(
//                 minWidth: double.infinity,
//                 onPressed: () {},
//                 child: Text(
//                   buttonName,
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.normal,
//                       fontFamily: 'Roboto',
//                       fontSize: 20),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void startTimer() {
//     const onsec = Duration(seconds: 1);
//     Timer _timer = Timer.periodic(onsec, (timer) {
//       if (start == 0) {
//         setState(() {
//           timer.cancel();
//           wait = false;
//         });
//       } else {
//         setState(() {
//           start--;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       resizeToAvoidBottomInset: false,
//       body: Padding(
//         padding: EdgeInsets.only(top: 40),
//         child: Container(
//           margin: EdgeInsets.only(top: 40.0),
//           color: Colors.white,
//           height: MediaQuery.of(context).size.height,
//           width: double.infinity,
//           child: Column(
// //          mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(
//                 height: 40,
//               ),
//               Text(
//                 "Let's verify your identity!",
//                 style: TextStyle(fontFamily: 'Poppins', fontSize: 25),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 margin: EdgeInsets.only(right: 40.0, left: 40.0),
//                 child: Text(
//                   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. ",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontFamily: 'Poppins',
//                     fontSize: 14,
//                     color: Color(0xFF000000).withOpacity(0.6),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 margin: EdgeInsets.only(left: 50),
//                 child: currentState ==
//                         MobileVerificationState.SHOW_MOBILE_FORM_STATE
//                     ? Text(
//                         "Enter your Mobile Number",
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: 14,
//                           color: Color(0xFF000000).withOpacity(0.6),
//                         ),
//                       )
//                     : Text(
//                         "Enter 6 Digit Verfication Code",
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: 14,
//                           color: Color(0xFF000000).withOpacity(0.6),
//                         ),
//                       ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
//                   ? getMobileFormWidget(context)
//                   : getOtpFormWidget(context),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }












// // Form(
// //                 key: _formKey,
// //                 child: Column(
// //                   children: [
// //                     Container(
// //                       margin: EdgeInsets.symmetric(horizontal: 40.0),
// //                       decoration: BoxDecoration(
// //                         color: Color(0xffF7F5F6),
// //                         borderRadius: BorderRadius.circular(10),
// //                       ),
// //                       child: Row(
// //                         mainAxisAlignment: MainAxisAlignment.start,
// //                         children: [
// //                           Container(
// //                             decoration: BoxDecoration(
// //                               color: Color(0xffC4C4C4),
// //                               borderRadius: BorderRadius.circular(10),
// //                             ),
// //                             child: Padding(
// //                               padding: EdgeInsets.all(15.0),
// //                               child: Text(
// //                                 '+91',
// //                                 style: TextStyle(
// //                                   color: Colors.white,
// //                                   fontFamily: 'Poppins',
// //                                   fontSize: 12,
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                           Flexible(
// //                             child: TextFormField(
// //                               validator: (value) {
// //                                 return RegExp(r"^[0-9]")
// //                                         .hasMatch(value.toString())
// //                                     ? null
// //                                     : 'Enter correct Phone number';
// //                               },
// //                               keyboardType: TextInputType.number,
// //                               decoration: const InputDecoration(
// //                                 border: InputBorder.none,
// //                                 contentPadding: EdgeInsets.all(4),
// //                                 enabledBorder: InputBorder.none,
// // //                        errorBorder: InputBorder.none,
// //                                 hintText: ' Phone Number',
// //                                 hintStyle: TextStyle(
// //                                   fontSize: 12,
// //                                   fontWeight: FontWeight.bold,
// //                                   color: Colors.grey,
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     SizedBox(
// //                       height: 40,
// //                     ),
// //                     Container(
// // //                    height: 40,
// // //            width: 189,
// //                       margin: EdgeInsets.symmetric(horizontal: 70),
// //                       decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.circular(10),
// //                         color: Color(0xffFE834F),
// //                       ),
// //                       child: Center(
// //                         child: MaterialButton(
// //                           minWidth: double.infinity,
// //                           onPressed: () {
// // //                  var val = await signMeIn();
// // //                  print(val);
// // //                  if (val == 'error') {
// // //                    print('error recieved');
// // //                    ScaffoldMessenger.of(context).showSnackBar(
// // //                      SnackBar(
// // //                        content: Text(
// // //                          authMethods.errorMessage,
// // //                          style: TextStyle(
// // //                            color: Color(0xffFE834F),
// // //                          ),
// // //                        ),
// // //                      ),
// // //                    );
// // //                  }
// // //                              Navigator.of(context).push(MaterialPageRoute(
// // //                                  builder: (context) => Register(toggle)));
// //                           },
// //                           child: Text(
// //                             "Send OTP",
// //                             style: TextStyle(
// //                                 color: Colors.white,
// //                                 fontWeight: FontWeight.normal,
// //                                 fontFamily: 'Roboto',
// //                                 fontSize: 20),
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),