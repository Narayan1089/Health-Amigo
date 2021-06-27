import 'package:flutter/material.dart';

class BlogDetails extends StatefulWidget {
//  const BlogDetails({Key key}) : super(key: key);

  @override
  _BlogDetailsState createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: ListTile(
                  title: Text('Settings'),
                  trailing: Icon(Icons.settings),
                  onTap: () => {Navigator.pop(context)},
                ),
                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
              ),
              ListTile(
                title: Text('Account Details'),
                onTap: () => {Navigator.pop(context)},
              ),
              ListTile(
                title: Text('Subscription Details'),
                onTap: () => {Navigator.pop(context)},
              ),
              ListTile(
                title: Text('About Info'),
                onTap: () => {Navigator.pop(context)},
              ),
              ListTile(
                title: Text('Support'),
                onTap: () => {Navigator.pop(context)},
              ),
              ListTile(
                title: Text('Logout'),
                onTap: () => {Navigator.pop(context)},
              ),
              ListTile(
                title: Text('Privacy Policy'),
                onTap: () => {Navigator.pop(context)},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            'Amigo!',
            style: TextStyle(color: Colors.orangeAccent),
          ),
          elevation: 20,
          shadowColor: Colors.grey,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                debugPrint('Searching ...');
              },
            ),
          ],
        ),
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
