import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirestoreConfig {
  Map<String, dynamic>? data;
  Map<String, dynamic>? data2;

  int? mood;
  String? thought;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  updateMoodTrack(
      {required User? user, required int mood, DateTime? dateTime}) async {
    await _firestore
        .collection('users')
        .doc(user!.uid)
        // .update({'moodTrack': mood})
        .set({
          'moodTracks': FieldValue.arrayUnion([
            {
              "moods": mood,
              "dateTime": dateTime,
            },
          ]),
        }, SetOptions(merge: true))
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
              mood = data!['moodTracks'].last['moods'],
              print(data!['name'] + ' ' + data!['moodTracks'].toString()),
            })
        // ignore: invalid_return_type_for_catch_error
        .catchError((error) => print("Failed to fetch user data: $error"));
  }

  retrieveCountofMoodTracker(User? user) async {
    await _firestore
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) => {
              data = value.data(),
              mood = data!['moodTracks'].last['moods'],
              print(data!['name'] + ' ' + data!['moodTracks'].toString()),
            })
        // ignore: invalid_return_type_for_catch_error
        .catchError((error) => print("Failed to fetch user data: $error"));
  }

  updateThoughts(
      {required User? user,
      required String thought,
      DateTime? dateTime}) async {
    _firestore
        .collection('users')
        .doc(user!.uid)

        // .collection('userThoughts')
        // .add({
        //   'thoughts': thought,
        //   'dateTime': dateTime,
        // })

        .set({
          'thoughts': thought,
          'dateTime': dateTime,
        })
        .then((value) => print('Thoughts updated'))
        .catchError((error) => print("Failed to update user: $error"));

    // .set({
    //   'thoughts': thought,
    //   'dateTime': dateTime,
    //   "userThoughts": FieldValue.arrayUnion([
    //     {
    //       "thoughts": thought + "",
    //       "dateTime": dateTime,
    //     },
    //   ]),
    // }, SetOptions(merge: true))
  }

  retrieveThoughts(User? user) {
    _firestore
        .collection('users')
        .doc(user!.uid)
        .collection('userThoughts')
        .doc()
        .get()
        .then((value) => {
              data = value.data(),
              thought = data!['thoughts'].toString(),
              print("Values retrieved:" + thought.toString()),
            })

        // ignore: invalid_return_type_for_catch_error
        .catchError((error) => print("Failed to fetch user data: $error"));
    // debugPrint("Thougts: " + thought!);
  }
}
