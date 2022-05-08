import 'package:amigoproject/app_screens/widget_screens/barchart_graph.dart';
import 'package:amigoproject/app_screens/widget_screens/thoughts.dart';

import 'package:amigoproject/models/barchart.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:table_calendar/table_calendar.dart';

// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:charts_flutter/flutter.dart' as charts;

bool showCase = true;
User? loggedInUser;
final double barWidth = 22;

class MoodChartData {
  MoodChartData(this.mood, this.count);
  final String mood;
  final double count;
}

// final List<BarChartModel> data = [
//   BarChartModel(
//     year: "2014",
//     financial: 250,
//     // color: charts.ColorUtil.fromDartColor(Color(0xFF47505F)),
//   ),
//   BarChartModel(
//     year: "2015",
//     financial: 300,
//     // color: charts.ColorUtil.fromDartColor(Colors.red),
//   ),
//   BarChartModel(
//     year: "2016",
//     financial: 100,
//     // color: charts.ColorUtil.fromDartColor(Colors.green),
//   ),
//   BarChartModel(
//     year: "2017",
//     financial: 450,
//     // color: charts.ColorUtil.fromDartColor(Colors.yellow),
//   ),
//   BarChartModel(
//     year: "2018",
//     financial: 630,
//     // color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
//   ),
//   BarChartModel(
//     year: "2019",
//     financial: 1000,
//     // color: charts.ColorUtil.fromDartColor(Colors.pink),
//   ),
//   BarChartModel(
//     year: "2020",
//     financial: 400,
//     // color: charts.ColorUtil.fromDartColor(Colors.purple),
//   ),
// ];

class AboutInfo extends StatefulWidget {
  const AboutInfo({Key? key}) : super(key: key);

  @override
  State<AboutInfo> createState() => _AboutInfoState();
}

class _AboutInfoState extends State<AboutInfo> {
  final List<MoodChartData> chartData = [
    MoodChartData('Angry', 22),
    MoodChartData('Happy', 18),
    MoodChartData('Sad', 30),
    MoodChartData('Neutral', 20),
    MoodChartData('Happy', 14),
    MoodChartData('Very Happy', 18),
    MoodChartData('Excited', 13)
  ];

  CalendarFormat format = CalendarFormat.week;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  // final keyOne = GlobalKey();

  // final _auth = FirebaseAuth.instance;

  // Future<void> getCurrentUser() async {
  //   try {
  //     final user = _auth.currentUser;

  //     if (user != null) {
  //       loggedInUser = user;
  //       if (loggedInUser != null) {
  //         // email = loggedInUser?.email;
  //         // id = loggedInUser?.uid;
  //         // name = loggedInUser?.displayName;
  //       }
  //     }
  //     print(user);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // void initState() {
  //   super.initState();
  //   getCurrentUser();
  //   // Provider.of<MoodClass>(context).displayMood();
  //   // mood = displayMood();

  //   if (showCase) {
  //     WidgetsBinding.instance!.addPostFrameCallback(
  //       (_) => ShowCaseWidget.of(context)!.startShowCase([keyOne]),
  //     );
  //     setState(() {
  //       showCase = false;
  //     });
  //   }

  //   Provider.of<ThoughtsProvider>(context, listen: false).displayThoughts();
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   // Provider.of<MoodClass>(context).displayMood();
  // }

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
      body:
          // LayoutBuilder(
          //   builder: (BuildContext context, BoxConstraints viewportConstraints) {
          SingleChildScrollView(
        // child: ConstrainedBox(
        //   constraints: BoxConstraints(
        //     maxHeight: viewportConstraints.maxHeight - 15,
        //   ),
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
              firstDay: DateTime.utc(2021, 8, 1),
              lastDay: DateTime.utc(2022, 10, 30),
              focusedDay: DateTime.now(),
              calendarFormat: format,
              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: Colors.amberAccent,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                    color: Color(0xfffa9d6a), shape: BoxShape.circle),
                // markerDecoration: BoxDecoration(color: Color(0xffFF834F)),
              ),
              onFormatChanged: (CalendarFormat _format) {
                setState(() {
                  format = _format;
                });
              },
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
                print(focusedDay);
              },
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(2),
              child: GestureDetector(
                // onTap: () => Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => ThoughtsPage())),
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
                        child:
                            // thoughtsProvider.thought == ""
                            //     ? Text(
                            //         "Click here to add",
                            //         style: TextStyle(
                            //           color: Colors.red,
                            //         ),
                            //       )
                            //     :
                            Text(
                          thoughtsProvider.thought.toString(),
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ),
            // SfCartesianChart(
            //   // backgroundColor: Colors.black,
            //   title: ChartTitle(text: 'Mood Log'),
            //   primaryXAxis: CategoryAxis(),
            //   series: <ChartSeries>[
            //     // Renders line chart
            //     LineSeries<MoodChartData, String>(
            //         dataSource: chartData,
            //         xValueMapper: (MoodChartData count, _) => count.mood,
            //         yValueMapper: (MoodChartData count, _) => count.count,
            //         name: 'Mood Chart'),
            //   ],
            // ),
            SizedBox(
              height: 5,
            ),

            // Expanded(
            //   child: BarChart(
            //     BarChartData(
            //       alignment: BarChartAlignment.center,
            //       maxY: 20,
            //       minY: 0,
            //       groupsSpace: 12,
            //       barTouchData: BarTouchData(enabled: true),
            //       titlesData: FlTitlesData(
            //         topTitles: BarTitles.getTopBottomTitles(),
            //         bottomTitles: BarTitles.getTopBottomTitles(),
            //         leftTitles: BarTitles.getSideTitles(),
            //         rightTitles: BarTitles.getSideTitles(),
            //       ),
            //       barGroups: BarData.barData
            //           .map(
            //             (data) => BarChartGroupData(
            //               x: data.id,
            //               barRods: [
            //                 BarChartRodData(
            //                   y: data.y,
            //                   width: barWidth,
            //                   colors: [data.color],
            //                   borderRadius: BorderRadius.only(
            //                     topLeft: Radius.circular(6),
            //                     topRight: Radius.circular(6),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           )
            //           .toList(),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
    //     },
    //   ),
    // );
  }
}
