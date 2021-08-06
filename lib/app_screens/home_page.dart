import 'package:amigoproject/app_screens/blog_details_pg.dart';
import 'package:amigoproject/app_screens/blogs_page.dart';
import 'package:amigoproject/services/database/db.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

User? loggedInUser;
String? moodText = '';
FirestoreConfig _firestoreConfig = FirestoreConfig();
// MediaQueryData mediaQueryData = MediaQuery.of(context);

class Home extends StatefulWidget {
//  const Home({required Key key, required String title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = FirebaseAuth.instance;

  Blogs _blog = Blogs();

  String? email = '';
  String? id = '';
  String? name = '';
  String? mood = '';

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
    // Provider.of<MoodClass>(context).displayMood();
    // mood = displayMood();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Provider.of<MoodClass>(context).displayMood();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                // trailing: Icon(Icons.calendar_today_outlined),
              ),
              // SizedBox(
              //   height: 5,
              // ),
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
                  // ImageIcon(
                  //   AssetImage('assets/images/happy.png'),
                  //   size: 40,
                  // ),
                  IconButton(
                    disabledColor: Colors.blue,
                    onPressed: () async {
                      // int mood = 3;
                      await moodTracker(mood: 3, user: loggedInUser);
                      // mood = displayMood();
                      Provider.of<MoodClass>(context, listen: false)
                          .displayMood();
                      // setState(() {
                      //   mood = moodText;
                      // });
                    },
                    icon: Icon(
                      Icons.face,
                      size: 40,
                    ),
                    color: Colors.pinkAccent,
                  ),
                  IconButton(
                    onPressed: () async {
                      await moodTracker(mood: 2, user: loggedInUser);
                      Provider.of<MoodClass>(context, listen: false)
                          .displayMood();
                      // setState(() {
                      //   mood = moodText;
                      // });
                    },
                    icon: Icon(
                      Icons.face_rounded,
                      size: 40,
                    ),
                    color: Colors.lightGreen.shade300,
                  ),
                  IconButton(
                    onPressed: () async {
                      await moodTracker(mood: 1, user: loggedInUser);
                      Provider.of<MoodClass>(context, listen: false)
                          .displayMood();
                    },
                    icon: Icon(
                      Icons.face,
                      size: 40,
                    ),
                    color: Colors.yellow,
                  ),
                  IconButton(
                    onPressed: () async {
                      await moodTracker(mood: 0, user: loggedInUser);
                      Provider.of<MoodClass>(context, listen: false)
                          .displayMood();
                    },
                    icon: Icon(
                      Icons.face,
                      size: 40,
                    ),
                    color: Colors.grey,
                  ),
                  IconButton(
                    onPressed: () async {
                      await moodTracker(mood: -1, user: loggedInUser);
                      Provider.of<MoodClass>(context, listen: false)
                          .displayMood();
                    },
                    icon: Icon(
                      Icons.face,
                      size: 40,
                    ),
                    color: Colors.blueAccent,
                  ),
                  IconButton(
                    onPressed: () async {
                      await moodTracker(mood: -2, user: loggedInUser);
                      Provider.of<MoodClass>(context, listen: false)
                          .displayMood();
                    },
                    icon: Icon(
                      Icons.face,
                      size: 40,
                    ),
                    color: Colors.purple.shade800,
                  ),
                  IconButton(
                    onPressed: () async {
                      await moodTracker(mood: -3, user: loggedInUser);
                      Provider.of<MoodClass>(context, listen: false)
                          .displayMood();
                    },
                    icon: Icon(
                      Icons.face,
                      size: 40,
                    ),
                    color: Colors.red,
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                // alignment: AlignmentGeometry.lerp(a, b, t),
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                width: 400,
                height: 220,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: Color(0xffE5E5E5),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Quote of the Day',
                      style: TextStyle(
                          // color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 20),
                    ),
                    // Text(
                    //   'your day',
                    //   style: TextStyle(
                    //       // color: Colors.white,
                    //       fontFamily: 'Montserrat',
                    //       fontWeight: FontWeight.w600,
                    //       fontStyle: FontStyle.normal,
                    //       fontSize: 20),
                    // ),
                    SizedBox(
                      height: 33,
                    ),
                    Text(
                      'I am incharge of how I feel,',
                      style: TextStyle(
                          // color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.normal,
                          fontSize: MediaQuery.of(context).size.width * 0.05),
                    ),
                    Text(
                      'I am choosing happiness.',
                      style: TextStyle(
                          // color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.normal,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child:
                          Consumer<MoodClass>(builder: (context, mood, child) {
                        String message = mood._moodStatus;
                        debugPrint("Mood Message: " + message);
                        return Text(
                          message.toString(),
                          style: TextStyle(
                              color: mood._color,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.normal,
                              fontSize: 18),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              // Container(
              //   width: 370,
              //   height: 220,
              //   padding: EdgeInsets.only(top: 10, bottom: 10),
              //   decoration: BoxDecoration(
              //       color: Color(0xffE5E5E5),
              //       borderRadius: BorderRadius.circular(10)),
              //   child: Column(
              //     children: [
              //       SizedBox(
              //         height: 55,
              //       ),
              //       Text(
              //         'Let’s prepare for',
              //         style: TextStyle(
              //             // color: Colors.white,
              //             fontFamily: 'Montserrat',
              //             fontWeight: FontWeight.w600,
              //             fontStyle: FontStyle.normal,
              //             fontSize: 20),
              //       ),
              //       Text(
              //         'your day',
              //         style: TextStyle(
              //             // color: Colors.white,
              //             fontFamily: 'Montserrat',
              //             fontWeight: FontWeight.w600,
              //             fontStyle: FontStyle.normal,
              //             fontSize: 20),
              //       ),
              //       SizedBox(
              //         height: 23,
              //       ),
              //       Text(
              //         'So nothing will break your inner peace',
              //         style: TextStyle(
              //             // color: Colors.white,
              //             fontFamily: 'Montserrat',
              //             fontWeight: FontWeight.w400,
              //             fontStyle: FontStyle.normal,
              //             fontSize: 10.47),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(13, 0, 0, 0),
                child: Text(
                  'Must Read Blogs',
                  style: TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 20),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    // height: 230,
                    // width: 150,
                    child: GestureDetector(
                      child: Card(
                        elevation: 3,
                        child: Image(
                          image: NetworkImage(_blog.blogs[0].url),
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: MediaQuery.of(context).size.width * 0.40,
                        ),
                      ),
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlogDetails(
                                      blog: _blog.blogs[0],
                                    )))
                      },
                    ),
                  ),
                  Container(
                    // height: 230,
                    // width: 150,
                    child: GestureDetector(
                      child: Card(
                        elevation: 3,
                        child: Image(
                          image: NetworkImage(_blog.blogs[1].url),
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: MediaQuery.of(context).size.width * 0.40,
                        ),
                      ),
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlogDetails(
                                      blog: _blog.blogs[1],
                                    )))
                      },
                    ),
                  ),
                ],
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

moodTracker({int? mood, User? user}) async {
  _firestoreConfig.retrieveMoodTracker(loggedInUser);
  int? prev = _firestoreConfig.mood;
  int? avg = (prev! + mood!) ~/ 2;
  await _firestoreConfig.updateMoodTrack(user: loggedInUser, mood: avg);
}

class MoodClass with ChangeNotifier {
  int? _data;
  String _moodStatus = "Mood Tracker";
  Color _color = Colors.white;
  String get moodStatus => _moodStatus;
  Color get color => _color;
  // int? get data = _data;

  void displayMood() async {
    await _firestoreConfig.retrieveMoodTracker(loggedInUser);
    _data = _firestoreConfig.mood;
    switch (_data) {
      case (2):
        _moodStatus = "Stay Motivated";
        _color = Colors.green;
        notifyListeners();
        // return moodText;
        break;
      case (1):
        _moodStatus = "Stay Happy";
        _color = Colors.yellow;
        notifyListeners();
        // return moodText;
        break;
      case (0):
        _moodStatus = "Mood with MoodTracker";
        _color = Colors.white;
        notifyListeners();
        // return moodText;
        break;
      case (-1):
        _moodStatus = "Don't Worry. Stay Strong";
        _color = Colors.blue;
        notifyListeners();
        // return moodText;
        break;
      case (-2):
        _moodStatus = "Stay strong and be Happy!";
        _color = Colors.purple;
        notifyListeners();
        // return moodText;
        break;
      default:
        _moodStatus = "Try out our mood tracker!";
        _color = Colors.grey;
        notifyListeners();
      // return moodText;

    }
    // notifyListeners();
  }
}
