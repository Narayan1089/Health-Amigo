import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreConfig {
  Map<String, dynamic>? data;
  int? mood;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  updateMoodTrack({required User? user, required int mood}) async {
    _firestore
        .collection('users')
        .doc(user!.uid)
        .update({'moodTrack': mood})
        .then((value) => print('User data updated'))
        .catchError((error) => print("Failed to update user: $error"));
  }

  retrieveMoodTracker(User? user) {
    _firestore
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
}
