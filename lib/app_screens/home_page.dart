import 'package:amigoproject/app_screens/blog_details_pg.dart';
import 'package:amigoproject/app_screens/blogs_page.dart';
import 'package:amigoproject/app_screens/widget_screens/thoughts.dart';
import 'package:amigoproject/providers/thoughts_provider.dart';
import 'package:amigoproject/services/database/db.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'package:showcaseview/showcaseview.dart';

User? loggedInUser;
String? moodText = '';
bool showCase = true;
FirestoreConfig _firestoreConfig = FirestoreConfig();
// MediaQueryData mediaQueryData = MediaQuery.of(context);

List quotes = [
  "Don't expect things to happen.\n It's better to be surprised than to be disappointed.",
  "I am incharge of how I feel,\n I am choosing happiness.",
  "Wake up with determination.\n Go to bed with satisfaction.",
  "Just because it’s hard; \ndoesn’t mean; \nit’s impossible. You can do it.",
  "Everything is possible.\n The impossible just takes longer.",
  "The less you care what others think,\n the happier you’ll be.",
];
int randomQuotes = Random().nextInt(quotes.length);

class Home extends StatefulWidget {
//  const Home({required Key key, required String title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = FirebaseAuth.instance;

  Blogs _blog = Blogs();

  final keyOne = GlobalKey();

  String? email = '';
  String? id = '';
  String? name = '';
  String? mood = '';
  // List quotes = [
  //   '',
  //   '',
  //   '',
  //   '',
  //   '',
  //   '',
  // ];

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

    if (showCase) {
      WidgetsBinding.instance!.addPostFrameCallback(
        (_) => ShowCaseWidget.of(context)!.startShowCase([keyOne]),
      );
      setState(() {
        showCase = false;
      });
    }

    Provider.of<MoodClass>(context, listen: false).displayMood();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Provider.of<MoodClass>(context).displayMood();
  }

  @override
  Widget build(BuildContext context) {
    ThoughtsProvider thoughtsProvider =
        Provider.of<ThoughtsProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          backgroundColor: Color(0xffFE834F),
          content: Text(
            'Tap back again to leave',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2,
                ),
                ListTile(
                  // leading: Icon(Icons.face_rounded),
                  title: Text(
                    'Welcome, ' +
                        loggedInUser!.displayName.toString().split(" ")[0],
                    style: TextStyle(
                        // color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w900,
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
                // Showcase(
                //   key: keyOne,
                //   // title: 'Mood Tracker',
                //   description: 'Tap to log mood!',
                //   overlayPadding: EdgeInsets.fromLTRB(3, 3, 3, 12),
                //   shapeBorder: CircleBorder(),
                //   animationDuration: Duration(milliseconds: 1500),
                //   // tooltipColor: Colors.blueGrey,
                //   overlayColor: Color(0xff222222),
                //   // disposeOnTap: true,
                //   child:
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
                    Column(
                      children: [
                        IconButton(
                          onPressed: () async {
                            await moodTracker(mood: -3, user: loggedInUser);
                            Provider.of<MoodClass>(context, listen: false)
                                .displayMood();
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.angry,
                            size: 35,
                          ),
                          color: Colors.red,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        // Container(
                        //   child: Text(
                        //     'Angry',
                        //     textAlign: TextAlign.center,
                        //     style: TextStyle(
                        //         color: Colors.red,
                        //         fontFamily: 'Montserrat',
                        //         fontWeight: FontWeight.w600,
                        //         fontStyle: FontStyle.normal,
                        //         fontSize:
                        //             MediaQuery.of(context).size.width * 0.021),
                        //   ),
                        // )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () async {
                            await moodTracker(mood: -2, user: loggedInUser);
                            Provider.of<MoodClass>(context, listen: false)
                                .displayMood();
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.meh,
                            size: 35,
                          ),
                          color: Colors.purple.shade800,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        // Container(
                        //   child: Text(
                        //     'Bored',
                        //     textAlign: TextAlign.center,
                        //     style: TextStyle(
                        //         color: Colors.purple.shade800,
                        //         fontFamily: 'Montserrat',
                        //         fontWeight: FontWeight.w600,
                        //         fontStyle: FontStyle.normal,
                        //         fontSize:
                        //             MediaQuery.of(context).size.width * 0.021),
                        //   ),
                        // )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () async {
                            await moodTracker(mood: -1, user: loggedInUser);
                            Provider.of<MoodClass>(context, listen: false)
                                .displayMood();
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.sadTear,
                            size: 35,
                          ),
                          color: Colors.blueAccent,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        // Container(
                        //   child: Text(
                        //     'Sad',
                        //     textAlign: TextAlign.center,
                        //     style: TextStyle(
                        //         color: Colors.blueAccent,
                        //         fontFamily: 'Montserrat',
                        //         fontWeight: FontWeight.w600,
                        //         fontStyle: FontStyle.normal,
                        //         fontSize:
                        //             MediaQuery.of(context).size.width * 0.021),
                        //   ),
                        // )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () async {
                            await moodTracker(mood: 0, user: loggedInUser);
                            Provider.of<MoodClass>(context, listen: false)
                                .displayMood();
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.smile,
                            size: 35,
                          ),
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        // Container(
                        //   child: Text(
                        //     'Neutral',
                        //     textAlign: TextAlign.center,
                        //     style: TextStyle(
                        //         color: Colors.grey,
                        //         fontFamily: 'Montserrat',
                        //         fontWeight: FontWeight.w600,
                        //         fontStyle: FontStyle.normal,
                        //         fontSize:
                        //             MediaQuery.of(context).size.width * 0.021),
                        //   ),
                        // )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () async {
                            await moodTracker(mood: 1, user: loggedInUser);
                            Provider.of<MoodClass>(context, listen: false)
                                .displayMood();
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.laugh,
                            size: 35,
                          ),
                          color: Colors.yellow.shade600,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        // Container(
                        //   child: Text(
                        //     'Happy',
                        //     textAlign: TextAlign.center,
                        //     style: TextStyle(
                        //         color: Colors.yellow.shade600,
                        //         fontFamily: 'Montserrat',
                        //         fontWeight: FontWeight.w600,
                        //         fontStyle: FontStyle.normal,
                        //         fontSize:
                        //             MediaQuery.of(context).size.width * 0.021),
                        //   ),
                        // )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () async {
                            await moodTracker(mood: 2, user: loggedInUser);
                            Provider.of<MoodClass>(context, listen: false)
                                .displayMood();
                            // setState(() {
                            //   mood = moodText;
                            // });
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.laughSquint,
                            size: 35,
                          ),
                          color: Colors.lightGreen.shade300,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        // Container(
                        //   child: Text(
                        //     'Very Happy',
                        //     textAlign: TextAlign.center,
                        //     style: TextStyle(
                        //         color: Colors.lightGreen.shade300,
                        //         fontFamily: 'Montserrat',
                        //         fontWeight: FontWeight.w600,
                        //         fontStyle: FontStyle.normal,
                        //         fontSize:
                        //             MediaQuery.of(context).size.width * 0.021),
                        //   ),
                        // )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                          icon: const FaIcon(
                            FontAwesomeIcons.grinStars,
                            size: 35,
                          ),
                          color: Colors.pinkAccent,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        // Container(
                        //   child: Text(
                        //     'Excited',
                        //     textAlign: TextAlign.center,
                        //     style: TextStyle(
                        //         color: Colors.pinkAccent,
                        //         fontFamily: 'Montserrat',
                        //         fontWeight: FontWeight.w600,
                        //         fontStyle: FontStyle.normal,
                        //         fontSize:
                        //             MediaQuery.of(context).size.width * 0.021),
                        //   ),
                        // )
                      ],
                    ),
                  ],
                ),
                // ),
                SizedBox(
                  height: 7,
                ),
                // Consumer<MoodClass>(builder: (context, mood, child) {
                //   return
                Container(
                  // alignment: AlignmentGeometry.lerp(a, b, t),
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: MediaQuery.of(context).size.width * 0.94,
                  height: MediaQuery.of(context).size.height * 0.18,
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  decoration: BoxDecoration(
                      color: Color(0xffE5E5E5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Quote of the Day',
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              // color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.normal,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05),
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
                          height: 30,
                        ),
                        Text(
                          quotes[randomQuotes].toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(

                              // color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.040),
                        ),
                        // Text(
                        //   'I am choosing happiness.',
                        //   style: TextStyle(
                        //       // color: Colors.white,
                        //       fontFamily: 'Montserrat',
                        //       fontWeight: FontWeight.w500,
                        //       fontStyle: FontStyle.normal,
                        //       fontSize:
                        //           MediaQuery.of(context).size.width * 0.040),
                        // ),
                        // SizedBox(
                        //   height: 23,
                        // ),mcsdk
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Consumer<MoodClass>(builder: (context, mood, child) {
                  String message = mood._moodStatus;
                  debugPrint("Mood Message: " + message);
                  return Container(
                    decoration: BoxDecoration(
                        color: mood._color,
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    width: MediaQuery.of(context).size.width * 0.94,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Center(
                      child: Text(
                        message.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w800,
                            fontStyle: FontStyle.normal,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.043),
                      ),
                    ),
                  );
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(2),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ThoughtsPage())),
                    child: Card(
                      color: Colors.grey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                            leading: Text(
                              'What\'s on your mind ?',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            // title: Text('The Enchanted Nightingale'),
                            trailing: Icon(Icons.arrow_forward_outlined,
                                color: Colors.black54),
                            onTap: null,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(13, 0, 0, 0),
                  child: Text(
                    ' Must Read Blogs',
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
                          elevation: 0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image(
                              image: NetworkImage(_blog.blogs[0].url),
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: MediaQuery.of(context).size.width * 0.40,
                            ),
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
                          elevation: 0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image(
                              image: NetworkImage(_blog.blogs[2].url),
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: MediaQuery.of(context).size.width * 0.40,
                            ),
                          ),
                        ),
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlogDetails(
                                        blog: _blog.blogs[2],
                                      )))
                        },
                      ),
                    ),
                  ],
                ),

                // SizedBox(
                //   height: 10,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     Container(
                //       // height: 230,
                //       // width: 150,
                //       child: GestureDetector(
                //         child: Card(
                //           elevation: 0,
                //           child: ClipRRect(
                //             borderRadius: BorderRadius.circular(15.0),
                //             child: Image(
                //               image: NetworkImage(_blog.blogs[3].url),
                //               height: MediaQuery.of(context).size.height * 0.25,
                //               width: MediaQuery.of(context).size.width * 0.40,
                //             ),
                //           ),
                //         ),
                //         onTap: () => {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => BlogDetails(
                //                         blog: _blog.blogs[3],
                //                       )))
                //         },
                //       ),
                //     ),
                //     Container(
                //       // height: 230,
                //       // width: 150,
                //       child: GestureDetector(
                //         child: Card(
                //           elevation: 0,
                //           child: ClipRRect(
                //             borderRadius: BorderRadius.circular(15.0),
                //             child: Image(
                //               image: NetworkImage(_blog.blogs[1].url),
                //               height: MediaQuery.of(context).size.height * 0.25,
                //               width: MediaQuery.of(context).size.width * 0.40,
                //             ),
                //           ),
                //         ),
                //         onTap: () => {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => BlogDetails(
                //                         blog: _blog.blogs[1],
                //                       )))
                //         },
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 10,
                ),
                // Card(
                //   elevation: 5,
                //   margin: EdgeInsets.fromLTRB(5, 15, 5, 0),
                //   child: ListTile(
                //     title: Text(
                //       'Notes',
                //       textAlign: TextAlign.center,
                //     ),
                //     trailing: Icon(Icons.note_add),
                //     onTap: () => Navigator.pushReplacement(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => Notes_Screen())),
                //   ),
                // ),

                // Container(
                //   padding: EdgeInsets.all(10),
                //   margin: EdgeInsets.all(2),
                //   child: GestureDetector(
                //     onTap: () => Navigator.pushReplacement(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => ThoughtsPage())),
                //     child: Card(
                //       color: Color(0xfffa9d6a),
                //       child: Column(
                //         mainAxisSize: MainAxisSize.min,
                //         children: <Widget>[
                //           const ListTile(
                //             leading: Text(
                //               'Today\'s thoughts',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontWeight: FontWeight.bold),
                //             ),
                //             // title: Text('The Enchanted Nightingale'),
                //             trailing: Icon(Icons.arrow_forward_outlined,
                //                 color: Colors.white),
                //             onTap: null,
                //           ),
                //           Padding(
                //             padding: const EdgeInsets.all(10.0),
                //             child: thoughtsProvider.thought == ""
                //                 ? Text(
                //                     "Click here to add",
                //                     style: TextStyle(
                //                       color: Colors.red,
                //                     ),
                //                   )
                //                 : Text(
                //                     thoughtsProvider.thought,
                //                     style: TextStyle(
                //                       color: Colors.white,
                //                     ),
                //                   ),
                //           ),
                //           const SizedBox(height: 10),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),

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
  // _firestoreConfig.retrieveMoodTracker(loggedInUser);
  // int? prev = _firestoreConfig.mood;
  // int? avg = ((prev! + mood!) / 2).ceil();
  await _firestoreConfig.updateMoodTrack(user: loggedInUser, mood: mood!);
}

class MoodClass with ChangeNotifier {
  int? _data;
  String _moodStatus = "Mood Tracker";
  Color _color = Colors.grey;
  String get moodStatus => _moodStatus;
  Color get color => _color;
  // int? get data = _data;

  void displayMood() async {
    await _firestoreConfig.retrieveMoodTracker(loggedInUser);
    _data = _firestoreConfig.mood;
    switch (_data) {
      case (3):
        _moodStatus = "Stay Excited";
        _color = Colors.pinkAccent;
        notifyListeners();
        // return moodText;
        break;
      case (2):
        _moodStatus = "Stay Motivated";
        _color = Colors.green;
        notifyListeners();
        // return moodText;
        break;
      case (1):
        _moodStatus = "Stay Happy";
        _color = Colors.yellow.shade600;
        notifyListeners();
        // return moodText;
        break;
      case (0):
        _moodStatus = "Neutral";
        _color = Colors.grey;
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
      case (-3):
        _moodStatus = "Stay Calm";
        _color = Colors.red;
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
