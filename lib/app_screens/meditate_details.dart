import 'package:flutter/material.dart';

class MeditateDetails extends StatefulWidget {
  const MeditateDetails({Key? key}) : super(key: key);

  @override
  _MeditateDetailsState createState() => _MeditateDetailsState();
}

class _MeditateDetailsState extends State<MeditateDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text('Meditate')),
      ),
    );
  }
}
