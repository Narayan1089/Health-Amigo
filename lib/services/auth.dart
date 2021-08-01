//import 'package:amigoproject/models/user.dart';
import 'dart:io';

import 'package:amigoproject/app_screens/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authState => _auth.idTokenChanges();
//  var token;
  String errorMessage = '';
  String err = '';
  bool e = false;
  String? verifyerror = '';

  /// Condition ? TRUE : FALSE
  User? _userFromFirebaseUser(User? user) {
    return user != null ? user : null;
  }

  Stream<User?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future<String> getCurrentuid() async {
    return _auth.currentUser!.uid;
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    User? user;

    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // print(result);
      user = result.user;
      if (user != null) {
        // await _firestore.;
        await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
          "name": user.displayName,
          "moodTrack": 0,
        });
        return _userFromFirebaseUser(user);
      }
      // if (!user!.emailVerified) {
      //   e = true;
      //   errorMessage =
      //       'Please verify your Email using the link sent on registered email.';
      //   return 'error';
      // } else {
      //   return _userFromFirebaseUser(user);
      // }

    } on SocketException {
      e = true;
      errorMessage = 'No interent connection!';
      return errorMessage;
    } on FirebaseAuthException catch (error) {
      e = true;
      switch (error.code) {
        case 'invalid-email':
          errorMessage = 'Your email address appears to be malformed.';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect Password! Please try again.';
          break;
        case 'user-not-found':
          errorMessage = "User with this email doesn't exist.";
          break;
        case 'ERROR_USER_DISABLED':
          errorMessage = 'User with this email has been disabled.';
          break;
        case 'ERROR_TOO_MANY_REQUESTS':
          errorMessage = 'Too many requests. Try again later.';
          break;
        case 'ERROR_OPERATION_NOT_ALLOWED':
          errorMessage = 'Signing in with Email and Password is not enabled.';
          break;
        default:
          errorMessage = 'Invalid Credentials Entered!';
      }
      return 'error';
    }
  }

  Future signUpWithEmailAndPassword(
      String email, String password, String username) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }

      user?.updateDisplayName(username);
      print(errorMessage);
      return _userFromFirebaseUser(user);
    } on SocketException {
      e = true;
      errorMessage = 'No interent connection!';
      print(1);
      return 'error';
    } on FirebaseAuthException catch (error) {
      e = true;
      print(error.message);
      switch (error.code) {
        case 'ERROR_OPERATION_NOT_ALLOWED':
          errorMessage = 'Indicates that Anonymous accounts are not enabled.';
          break;
        case 'ERROR_WEAK_PASSWORD':
          errorMessage = 'The password is not strong enough.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is malformed.';
          break;
        case 'email-already-in-use':
          errorMessage = 'The email is already in use by a different account.';
          break;
        case 'ERROR_INVALID_CREDENTIAL':
          errorMessage = 'The email address is malformed.';
          break;
        default:
          errorMessage = 'Add proper credentials ';
      }
      print(errorMessage);
      return 'error';
    }
  }

  Future resetPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut(BuildContext context) async {
    try {
      return await _auth.signOut().then((value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LogIn()));
      });
    } catch (e) {
      print(e.toString());
    }
  }

//  Future phoneVerification(
//    String number,
//    String email,
//    String password,
//  ) async {
//    try {
//      UserCredential result = await _auth.createUserWithEmailAndPassword(
//          email: email, password: password);
//      User? user = result.user;
//      _auth.verifyPhoneNumber(
//        phoneNumber: number,
//        verificationCompleted: (phoneAuthCredential) async {},
//        verificationFailed: (verificationFailed) {
//          verifyerror = verificationFailed.message;
//        },
//        codeSent: (verificationId, resendingToken) async {
//          this.verificationId = verificationId;
//        },
//        codeAutoRetrievalTimeout: (verificationId) async {},
//      );
//      if (verifyerror != "") {
//        return 'error';
//      }
//    } catch (e) {}
//  }
}
