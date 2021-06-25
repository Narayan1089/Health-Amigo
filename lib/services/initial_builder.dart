import 'package:flutter/material.dart';
import 'package:amigoproject/app_screens/blogs_page.dart';
import 'package:amigoproject/app_screens/chat_page.dart';
import 'package:amigoproject/app_screens/home_page.dart';
import 'package:amigoproject/app_screens/meditate_page.dart';
import 'package:amigoproject/app_screens/welcome_screen.dart';
import 'package:amigoproject/app_screens/chat_screen.dart';

void main() {
  runApp(Amigo());
}

class Amigo extends StatefulWidget {
//  const Amigo({Key key}) : super(key: key);
  @override
  _AmigoState createState() => _AmigoState();
}

Map<int, Color> color = {
  50: Color.fromRGBO(254, 131, 79, .1),
  100: Color.fromRGBO(254, 131, 79, .2),
  200: Color.fromRGBO(254, 131, 79, .3),
  300: Color.fromRGBO(254, 131, 79, .4),
  400: Color.fromRGBO(254, 131, 79, .5),
  500: Color.fromRGBO(254, 131, 79, .6),
  600: Color.fromRGBO(254, 131, 79, .7),
  700: Color.fromRGBO(254, 131, 79, .8),
  800: Color.fromRGBO(254, 131, 79, .9),
  900: Color.fromRGBO(254, 131, 79, 1),
};

class _AmigoState extends State<Amigo> {
  @override
  int _selectedpg = 0;
  final _pgOptions = [
    Home(),
    Meditate(),
    ChatScreen(),
    Blogs(),
  ];

  MaterialColor colorCustom = MaterialColor(0xffFE834F, color);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: colorCustom,
        buttonColor: colorCustom,
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
          actions: [
            IconButton(
              onPressed: () {},
              icon: Container(
                child: Image(
                  image: AssetImage('assets/images/sos_big.png'),
                  height: 100,
                  width: 100,
                ),
                height: 105,
                width: 105,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              iconSize: 26,
              color: Colors.black,
            ),
          ],
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.account_circle_rounded),
                    iconSize: 26,
                    color: Color(0xffFF834F),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.settings_outlined),
                    iconSize: 26,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Amigo",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
//       theme: ThemeData(primaryColor: Colors.orangeAccent));
    );
  }
}
