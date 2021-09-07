import 'package:amigoproject/providers/thoughts_provider.dart';
import 'package:amigoproject/services/initial_builder.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThoughtsPage extends StatefulWidget {
  const ThoughtsPage({Key? key}) : super(key: key);

  @override
  _ThoughtsPageState createState() => _ThoughtsPageState();
}

class _ThoughtsPageState extends State<ThoughtsPage> {
  TextEditingController userThoughts = TextEditingController();
  // var userText = "";
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
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),

                onChanged: (value) => setState(
                  () {
                    data.changeThoughts(value);
                    // userText = value;
                    // print(userText);
                  },
                ),

                // showCursor: true,
              ),
            ],
          ),
        ),
      );
    });
  }
}
