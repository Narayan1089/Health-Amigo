import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirestoreConfig {
  Map<String, dynamic>? data;
  // Map<String, dynamic>? data2;

  int? mood;
  String? thought;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  updateMoodTrack({required User? user, required int mood}) async {
    await _firestore
        .collection('users')
        .doc(user!.uid)
        .update({'moodTrack': mood})
        .then((value) => print('User data updated'))
        .catchError((error) => print("Failed to update user: $error"));
  }

  retrieveMoodTracker(User? user) async {
    await _firestore
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) => {
              data = value.data(),
              mood = data!['moodTrack'],
              print(data!['name'] + ' ' + data!['moodTrack'].toString()),
            })
        // ignore: invalid_return_type_for_catch_error
        .catchError((error) => print("Failed to fetch user data: $error"));
  }

  updateThoughts({required User? user, required String thought}) async {
    _firestore
        .collection('users')
        .doc(user!.uid)
        .set({'thoughts': thought}, SetOptions(merge: true))
        // .update({'thoughts': thought})
        .then((value) => print('Thoughts updated'))
        .catchError((error) => print("Failed to update user: $error"));
  }

  retrieveThoughts(User? user) {
    _firestore
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) => {
              data = value.data(),
              thought = data!['thoughts'].toString(),
              print("Values retrieved:" + data!['thoughts'].toString()),
            })

        // ignore: invalid_return_type_for_catch_error
        .catchError((error) => print("Failed to fetch user data: $error"));
    debugPrint("Thougts: " + thought!);
  }
}
