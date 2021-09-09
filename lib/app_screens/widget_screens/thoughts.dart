import 'package:amigoproject/providers/thoughts_provider.dart';
import 'package:amigoproject/services/database/db.dart';
import 'package:amigoproject/services/initial_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

User? loggedInUser;
String? userThougts = '';
FirestoreConfig _firestoreConfig = FirestoreConfig();

class ThoughtsPage extends StatefulWidget {
  const ThoughtsPage({Key? key}) : super(key: key);

  @override
  _ThoughtsPageState createState() => _ThoughtsPageState();
}

class _ThoughtsPageState extends State<ThoughtsPage> {
  TextEditingController userThoughts = TextEditingController();
  // var userText = "";
  final _auth = FirebaseAuth.instance;
  String? email = '';
  String? id = '';
  String? name = '';
  String? thought = '';

  Future<void> getCurrentUser() async {
    try {
      final user = _auth.currentUser;

      if (user != null) {
        loggedInUser = user;
        if (loggedInUser != null) {
          email = loggedInUser?.email;
          id = loggedInUser?.uid;
          name = loggedInUser?.displayName;
        }
      }
      print(user);
    } catch (e) {
      print(e);
    }
  }

  void initState() {
    super.initState();
    getCurrentUser();
    // Provider.of<MoodClass>(context).displayMood();
    // mood = displayMood();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Provider.of<MoodClass>(context).displayMood();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThoughtsProvider>(builder: (context, data, child) {
      // final text = data.changeThoughts(userText);
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (_) => Amigo(),
              //   ),
              // );
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Whatcha Thinking?",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: userThoughts,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                minLines: 1,
                maxLines: 20,
                decoration: InputDecoration(
                  // icon: Icons.edit as Widget,
                  hintText: 'Pen down your thoughts ...',
                  // border: InputBorder.,
                ),

                onChanged: (value) async {
                  await thoughtsTracker(thought: value, user: loggedInUser);
                  Provider.of<ThoughtsProvider>(context, listen: false)
                      .displayThoughts();
                },

                // onChanged: (value) async => setState(
                //   () {
                //     await thoughtsTracker(thought: value, user: loggedInUser);
                //        Provider.of<ThoughtsProvider>(context, listen: false)
                //                 .displayThoughts();
                //     // data.changeThoughts(value);
                //     // userText = value;
                //     // print(userText);
                //   },
                // ),

                // showCursor: true,

              ),
              // TextField(
              //   // strutStyle:
              //   //     StrutStyle(height: MediaQuery.of(context).size.height),
              //   controller: userThoughts,
              //   decoration: InputDecoration(
              //     // icon: Icons.edit as Widget,
              //     hintText: 'Pen down your thoughts ...',
              //     // border: InputBorder.,
              //   ),

              //   onChanged: (value) => setState(
              //     () {
              //       data.changeThoughts(value);
              //       // userText = value;
              //       // print(userText);
              //     },
              //   ),

              //   // showCursor: true,
              // ),
            ],
          ),
        ),
      );
    });
  }
}

thoughtsTracker({String? thought, User? user}) async {
  _firestoreConfig.retrieveThoughts(loggedInUser);
  // int? prev = _firestoreConfig.mood;
  // int? avg = ((prev! + mood!) / 2).ceil();
  await _firestoreConfig.updateThoughts(user: loggedInUser, thought: thought!);
}

class ThoughtsProvider extends ChangeNotifier {
  String? thought;

  void displayThoughts() async {
    await _firestoreConfig.retrieveThoughts(loggedInUser);

    thought = _firestoreConfig.thought!;

    // thought = thought;
    notifyListeners();
  }
}
