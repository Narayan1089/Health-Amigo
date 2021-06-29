import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

User? loggedInUser;

class Home extends StatefulWidget {
//  const Home({required Key key, required String title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = FirebaseAuth.instance;
  String? email = '';
  String? id = '';
  String? name = '';
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
  }

  @override
  Widget build(BuildContext context) {
    String userName = 'Sneh';

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListTile(
              // leading: Icon(Icons.face_rounded),
              title: Text('Welcome $name'),
              subtitle: Text('How do you feel right now?'),
              trailing: Icon(Icons.calendar_today_outlined),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.face_outlined),
                Icon(Icons.face_outlined),
                Icon(Icons.face_outlined),
                Icon(Icons.face_outlined),
                Icon(Icons.face_outlined),
                Icon(Icons.face_outlined),
                Icon(Icons.face_outlined),
              ],
            ),
            // Card(
            //   child: Column(
            //     children: [
            //       ListTile(
            //         title: Text('Stress Score'),
            //         trailing: Icon(Icons.menu),
            //       ),
            //       Divider(),
            //       ListBody(),
            //       Divider(),
            //       ListTile(
            //         title: Text('M   T   W   T   F   S   S'),
            //       )
            //     ],
            //   ),
            // ),
            ListTile(
              // leading: Icon(Icons.face_rounded),
              title: Text('Appointments'),
              trailing: TextButton(
                onPressed: () {},
                child: Text(
                  'View All',
                  style: TextStyle(color: Color(0xffFF834F)),
                ),
              ),
            ),
            Card(
                // margin: EdgeInsets.all(10),
                shape: null,
                elevation: 5,
                child: Column(
                  children: [
                    ListTile(
                      // isThreeLine: true,
                      leading: Icon(Icons.face_rounded),
                      title: Text('Doctor Name'),
                      subtitle: Text('Date \nTime Venue'),
                      trailing: Icon(Icons.lock_clock),
                    ),
                  ],
                )),
            ListTile(
              // leading: Icon(Icons.face_rounded),
              title: Text('Meditate'),
              trailing: TextButton(
                onPressed: () {},
                child: Text(
                  'View All',
                  style: TextStyle(color: Color(0xffFF834F)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  elevation: 5,
                  child: Icon(
                    Icons.ac_unit_outlined,
                    size: 100,
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Icon(
                    Icons.access_alarm_outlined,
                    size: 100,
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Icon(
                    Icons.accessibility_new_outlined,
                    size: 100,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  elevation: 5,
                  child: Icon(
                    Icons.ac_unit_outlined,
                    size: 100,
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Icon(
                    Icons.access_alarm_outlined,
                    size: 100,
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Icon(
                    Icons.accessibility_new_outlined,
                    size: 100,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  elevation: 5,
                  child: Icon(
                    Icons.ac_unit_outlined,
                    size: 100,
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Icon(
                    Icons.access_alarm_outlined,
                    size: 100,
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Icon(
                    Icons.accessibility_new_outlined,
                    size: 100,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
