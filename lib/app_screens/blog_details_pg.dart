import 'package:flutter/material.dart';

class BlogDetails extends StatefulWidget {
  // const BlogDetails({Key key}) : super(key: key);

  @override
  _BlogDetailsState createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.fromLTRB(5, 30, 5, 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The OCD Stories',
            style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            // textAlign: TextAlign.start,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.center,
            child: Icon(
              Icons.book_outlined,
              size: 200,
            ),
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black),
              text:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages",
            ),
          )
        ],
      ),
    ));
  }
}
