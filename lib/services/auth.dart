//import 'package:amigoproject/models/user.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authState => _auth.idTokenChanges();
//  var token;
  String errorMessage = '';
  String err = '';
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
      print(result);
      user = result.user;
      return _userFromFirebaseUser(user);
    } on SocketException {
      errorMessage = 'No interent connection!';
      return errorMessage;
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'ERROR_INVALID_EMAIL':
          errorMessage = 'Your email address appears to be malformed.';
          break;
        case 'ERROR_WRONG_PASSWORD':
          errorMessage = 'Your password is wrong.';
          break;
        case 'ERROR_USER_NOT_FOUND':
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
      errorMessage = 'No interent connection!';
      print(1);
      return 'error';
    } on FirebaseAuthException catch (error) {
      print(error.message);
      switch (error.code) {
        case 'ERROR_OPERATION_NOT_ALLOWED':
          errorMessage = 'Indicates that Anonymous accounts are not enabled.';
          break;
        case 'ERROR_WEAK_PASSWORD':
          errorMessage = 'The password is not strong enough.';
          break;
        case 'ERROR_INVALID_EMAIL':
          errorMessage = 'The email address is malformed.';
          break;
        case 'ERROR_EMAIL_ALREADY_IN_USE':
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

  Future signOut() async {
    try {
      return await _auth.signOut();
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
