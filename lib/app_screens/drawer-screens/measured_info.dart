import 'package:amigoproject/app_screens/widget_screens/thoughts.dart';
import 'package:amigoproject/providers/thoughts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class AboutInfo extends StatelessWidget {
  const AboutInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThoughtsProvider thoughtsProvider =
        Provider.of<ThoughtsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Measured Information',
          style: TextStyle(
            // fontSize: 36,
            // fontWeight: FontWeight.normal,
            // fontFamily: 'Lobster',
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   // alignment: AlignmentGeometry.lerp(a, b, t),
            //   margin: EdgeInsets.fromLTRB(13, 30, 13, 0),
            //   width: MediaQuery.of(context).size.width * 0.95,
            //   height: MediaQuery.of(context).size.height * 0.3,
            //   padding: EdgeInsets.only(top: 10, bottom: 10),
            //   decoration: BoxDecoration(
            //       color: Color(0xffE5E5E5),
            //       borderRadius: BorderRadius.circular(10)),
            //   child: Center(
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         // SizedBox(
            //         //   height: 10,
            //         // ),
            //         Text(
            //           'Account Details',
            //           style: TextStyle(
            //               // color: Colors.white,
            //               fontFamily: 'Montserrat',
            //               fontWeight: FontWeight.w800,
            //               fontStyle: FontStyle.normal,
            //               fontSize: MediaQuery.of(context).size.width * 0.04),
            //         ),
            //         SizedBox(
            //           height: 33,
            //         ),
            //         Text(
            //           'Name: ' + loggedInUser!.displayName.toString(),
            //           style: TextStyle(
            //               // color: Colors.white,
            //               fontFamily: 'Montserrat',
            //               fontWeight: FontWeight.w400,
            //               fontStyle: FontStyle.normal,
            //               fontSize: MediaQuery.of(context).size.width * 0.035),
            //         ),
            //         Text(
            //           'Email: ' + loggedInUser!.email.toString(),
            //           style: TextStyle(
            //               // color: Colors.white,
            //               fontFamily: 'Montserrat',
            //               fontWeight: FontWeight.w400,
            //               fontStyle: FontStyle.normal,
            //               fontSize: MediaQuery.of(context).size.width * 0.035),
            //         ),
            //         SizedBox(
            //           height: 20,
            //         ),
            //         Container(
            //           width: MediaQuery.of(context).size.width * 0.3,
            //           height: MediaQuery.of(context).size.height * 0.05,
            //           margin: EdgeInsets.symmetric(horizontal: 50),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(50),
            //             color: Color(0xffFE834F),
            //             // border: Border.all(color: Color(4B4C4D), width: 2),
            //           ),
            //           child: Center(
            //             child: TextButton(
            //               onPressed: () {
            //                 _launchInBrowser(url!);
            //                 // isDoctor = true;
            //                 // Navigator.of(context)
            //                 //     .push(MaterialPageRoute(builder: (context) => LogIn()));
            //               },
            //               child: Text(
            //                 // "Doctorjsvbdfj \nfcbsdb",
            //                 "Feedback",
            //                 style: TextStyle(
            //                     color: Colors.white,
            //                     fontWeight: FontWeight.normal,
            //                     fontFamily: 'Roboto',
            //                     fontSize: MediaQuery.of(context).size.height *
            //                         0.0175),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Container(
            //   padding: EdgeInsets.all(10),
            //   margin: EdgeInsets.all(2),
            //   child: GestureDetector(
            //     onTap: () => Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => ThoughtsPage())),
            //     child: Card(
            //       color: Colors.grey,
            //       child: Column(
            //         mainAxisSize: MainAxisSize.min,
            //         children: <Widget>[
            //           const ListTile(
            //             leading: Text(
            //               'What\'s on your mind ?',
            //               style: TextStyle(
            //                   color: Colors.black54,
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 18),
            //             ),
            //             // title: Text('The Enchanted Nightingale'),
            //             trailing: Icon(Icons.arrow_forward_outlined,
            //                 color: Colors.black54),
            //             onTap: null,
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            TableCalendar(
              firstDay: DateTime.utc(2021, 9, 1),
              lastDay: DateTime.utc(2021, 9, 30),
              focusedDay: DateTime.now(),
              calendarFormat: CalendarFormat.week,
              calendarStyle: CalendarStyle(
                markerDecoration: BoxDecoration(color: Color(0xffFF834F)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(2),
              child: GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ThoughtsPage())),
                child: Card(
                  color: Color(0xfffa9d6a),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Text(
                          'Today\'s thoughts',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // title: Text('The Enchanted Nightingale'),
                        // trailing: Icon(Icons.arrow_forward_outlined,
                        //     color: Colors.white),
                        onTap: null,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: thoughtsProvider.thought == ""
                            ? Text(
                                "Click here to add",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              )
                            : Text(
                                thoughtsProvider.thought,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
