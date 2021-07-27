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
    // String userName = 'Sneh';

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 10,
              ),
              ListTile(
                // leading: Icon(Icons.face_rounded),
                title: Text(
                  'Welcome, ' +
                      loggedInUser!.displayName.toString().split(" ")[0],
                  style: TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 20),
                ),
                subtitle: Text('How do you feel right now?',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        fontWeight: FontWeight.normal)),
                trailing: Icon(Icons.calendar_today_outlined),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // ImageIcon(
                  //   AssetImage('assets/images/angry_face.png'),
                  //   // size: 40,
                  // ),
                  // ImageIcon(
                  //   AssetImage('assets/images/angry_face.png'),
                  //   size: 40,
                  // ),
                  // Icon(Icons.face_outlined),
                  Icon(Icons.face_outlined),
                  Icon(Icons.face_outlined),
                  Icon(Icons.face_outlined),
                  Icon(Icons.face_outlined),
                  Icon(Icons.face_outlined),
                  Icon(Icons.face_outlined),
                  Icon(Icons.face_outlined),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 370,
                height: 220,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: Color(0xffE5E5E5),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 55,
                    ),
                    Text(
                      'Let’s prepare for',
                      style: TextStyle(
                          // color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 20),
                    ),
                    Text(
                      'your day',
                      style: TextStyle(
                          // color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    Text(
                      'So nothing will break your inner peace',
                      style: TextStyle(
                          // color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 10.47),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Card(
              //   margin: EdgeInsets.fromLTRB(5, 15, 5, 0),
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
              //         title: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           // crossAxisAlignment: CrossAxisAlignment.center,
              //           children: [
              //             Text('M'),
              //             Text('T'),
              //             Text('W'),
              //             Text('T'),
              //             Text('F'),
              //             Text('S'),
              //             Text('S'),
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              // ListTile(
              //   // leading: Icon(Icons.face_rounded),
              //   title: Text('Appointments'),
              //   trailing: TextButton(
              //     onPressed: () {},
              //     child: Text(
              //       'View All',
              //       style: TextStyle(color: Color(0xffFF834F)),
              //     ),
              //   ),
              // ),
              // Card(
              //     // margin: EdgeInsets.all(10),
              //     shape: null,
              //     // elevation: 5,
              //     child: Column(
              //       children: [
              //         ListTile(
              //           // isThreeLine: true,
              //           leading: Icon(Icons.face_rounded),
              //           title: Text('Doctor Name'),
              //           subtitle: Text('Date \nTime Venue'),
              //           trailing: Icon(Icons.lock_clock),
              //         ),
              //       ],
              //     )),
              // SizedBox(
              //   height: 10,
              // ),
              // ListTile(
              //   // leading: Icon(Icons.face_rounded),
              //   title: Text('Meditate'),
              //   trailing: TextButton(
              //     onPressed: () {},
              //     child: Text(
              //       'View All',
              //       style: TextStyle(color: Color(0xffFF834F)),
              //     ),
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     MeditateCard('assets/images/smile_face.png', 'Peace'),
              //     MeditateCard('assets/images/smile_face.png', 'Sad'),
              //     MeditateCard('assets/images/smile_face.png', 'Sleep'),
              //     MeditateCard('assets/images/smile_face.png', 'Sad'),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class MeditateCard extends StatelessWidget {
  late final String? title;
  late final String? image;

  MeditateCard(img, title) {
    this.title = title;
    this.image = img;
  }
  // const MoodCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 77.86,
      height: 90,
      child: GestureDetector(
        onTap: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => MeditateDetails()));
        },
        child: Card(
          color: Color(0xffFF834F),
          // elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 5,
              ),
              Image(
                image: AssetImage(image.toString()),
                height: 53,
                width: 58,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                title.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: 8.91),
              )
            ],
          ),
        ),
      ),
    );
  }
}
