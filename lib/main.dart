import 'package:amigoproject/app_screens/blogs_page.dart';
import 'package:amigoproject/app_screens/chat_page.dart';
import 'package:amigoproject/app_screens/home_page.dart';
import 'package:amigoproject/app_screens/meditate_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedpg = 0;
  final _pgOptions = [
    Home(),
    Meditate(),
    ChatBot(),
    Blogs(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.orange,
      ),
      // primaryTextTheme:
      //     TextTheme(headline4: TextStyle(color: Colors.orangeAccent))),
      home: Scaffold(
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
        body: _pgOptions[_selectedpg],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedpg,
          // selectedItemColor: Colors.orangeAccent,
          fixedColor: Colors.orangeAccent,
          onTap: (int index) {
            setState(() {
              _selectedpg = index;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Meditate'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Amigo'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Blogs'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'XYZ'),
          ],
        ),
      ),
      // theme: ThemeData(primaryColor: Colors.orangeAccent));
    );
  }
}
