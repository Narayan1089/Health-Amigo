import 'package:amigoproject/app_screens/doctors_pg.dart';
import 'package:amigoproject/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:amigoproject/app_screens/blogs_page.dart';
import 'package:amigoproject/app_screens/home_page.dart';
import 'package:amigoproject/app_screens/meditate_page.dart';
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
  final _pgOptions = [Home(), Meditate(), ChatScreen(), Blogs(), Doctor()];

  MaterialColor colorCustom = MaterialColor(0xffFE834F, color);

  AuthMethods authMethods = AuthMethods();

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
                margin: EdgeInsets.all(0),
                // margin: EdgeInsets.fromLTRB(0, top, right, bottom),
                child: ListTile(
                  title: Text('Settings'),
                  trailing: Icon(Icons.settings),
                  onTap: () => {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Amigo()))
                  },
                ),
                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.face_retouching_natural),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Account Details'),
                  ],
                ),
                onTap: () => {Navigator.pop(context)},
              ),
              // ListTile(
              //   title: Row(
              //     children: [
              //       Icon(Icons.subscriptions_outlined),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       Text('Subscription Details'),
              //     ],
              //   ),
              //   onTap: () => Navigator.push(context,
              //       MaterialPageRoute(builder: (_) => SubscriptionPage())),
              // ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.info_outline),
                    SizedBox(
                      width: 10,
                    ),
                    Text('About Info'),
                  ],
                ),
                onTap: () => {Navigator.pop(context)},
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.support_agent_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Support'),
                  ],
                ),
                onTap: () => {Navigator.pop(context)},
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Logout'),
                  ],
                ),
                onTap: () => {
                  authMethods.signOut(context),
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.privacy_tip),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Privacy Policy'),
                  ],
                ),
                onTap: () => {Navigator.pop(context)},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          actions: [
            // IconButton(
            //   onPressed: () {
            //     Navigator.of(context)
            //         .push(MaterialPageRoute(builder: (context) => SOS()));
            //   },
            //   icon: Container(
            //     child: Image(
            //       image: AssetImage('assets/images/sos_big.png'),
            //       height: 100,
            //       width: 100,
            //     ),
            //     height: 105,
            //     width: 105,
            //   ),
            // ),
            // SizedBox(
            //   width: 15,
            // ),
            // IconButton(
            //   onPressed: () {},
            //   icon: const Icon(Icons.search),
            //   iconSize: 26,
            //   color: Colors.black,
            // ),
          ],
          elevation: 0,
          // automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text(
            "Amigo",
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          // flexibleSpace: SafeArea(
          //   child: Container(
          //     padding: EdgeInsets.only(right: 16),
          // child: Row(
          //   children: <Widget>[
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.account_circle_rounded),
          //   iconSize: 26,
          //   color: Color(0xffFF834F),
          // ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.settings_outlined),
          //   iconSize: 26,
          // ),
          //     SizedBox(
          //       width: 60,
          //     ),
          //     Text(
          //       "Amigo",
          //       style: TextStyle(
          //         fontFamily: "Poppins",
          //         fontWeight: FontWeight.w700,
          //         fontSize: 20,
          //       ),
          //     ),
          //   ],
          // ),
          // ),
          // ),
        ),
        body: _pgOptions[_selectedpg],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedpg,
          // selectedItemColor: Colors.orangeAccent,
          fixedColor: Color(0xffFF834F),
          onTap: (int index) {
            setState(() {
              _selectedpg = index;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/home.png'),
                  size: 30,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/meditate.png'),
                  size: 30,
                ),
                label: 'Meditate'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/amigo-1.png'),
                  color: Color(0xffFF834F),
                  size: 30,
                ),
                // ImageIcon(
                //   AssetImage('assets/images/chatbot.png'),
                //   size: 30,
                // ),
                label: 'Amigo'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/blog.png'),
                  size: 30,
                ),
                label: 'Blogs'),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.local_hospital),
            //     // icon: ImageIcon(
            //     //   AssetImage('assets/images/doctor.png'),
            //     //   // size: 30,
            //     // ),
            //     label: 'Doctor'),
          ],
        ),
      ),
//       theme: ThemeData(primaryColor: Colors.orangeAccent));
    );
  }
}
