import 'package:flutter/material.dart';

class Blogs extends StatefulWidget {
  const Blogs({Key key}) : super(key: key);

  @override
  _BlogsState createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ListTile(
              title: Text('Blogs'),
              subtitle: Text('Feeling Happy or Sad? Vent it out with us.'),
            ),
          ],
        ),
      ),
    );
  }
}
