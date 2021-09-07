// // @dart = 2.9

// import 'package:amigoproject/app_screens/home_page.dart';
// import 'package:amigoproject/providers/notes_provider.dart';
// import 'package:amigoproject/providers/thoughts_provider.dart';
// import 'package:amigoproject/services/wrapper.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:provider/provider.dart';
// import 'package:amigoproject/services/auth.dart';

// class AfterSoS extends StatefulWidget {
//   @override
//   _AfterSoS createState() => _AfterSoS();
// }

// class _AfterSoS extends State<AfterSoS> {
//   @override
//   Widget build(BuildContext context) {
//     // return MaterialApp(
//     //     debugShowCheckedModeBanner: false,
//     //     home: Scaffold(

//     //         // appBar: AppBar(
//     //         //   title: Text('Home'),
//     //         // ),
//     //         body: TabScreen()));

//     return FutureBuilder(
//       future: Firebase.initializeApp(),
//       builder: (context, snapshot) {
//         // FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
//         // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
//         // Check for errors
//         if (snapshot.hasError) {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             home: Scaffold(
//               body: Center(
//                 child: Column(
//                   children: [Icon(Icons.error), Text("Something went wrong")],
//                 ),
//               ),
//             ),
//           );
//         }

//         // Once complete, show your application
//         if (snapshot.connectionState == ConnectionState.done) {
//           return MultiProvider(
//             providers: [
//               Provider<AuthMethods>(
//                 create: (_) => AuthMethods(),
//               ),
//               StreamProvider(
//                 create: (context) => context.read<AuthMethods>().authState,
//                 initialData: null,
//               ),
//               ChangeNotifierProvider(
//                 create: (_) => MoodClass(),
//               ),
//               ChangeNotifierProvider(
//                 create: (context) => NotesProviders(),
//               ),
//               ChangeNotifierProvider(
//                 create: (_) => ThoughtsProvider(),
//               ),
//             ],
//             child: MaterialApp(
//               debugShowCheckedModeBanner: false,
//               home: Scaffold(
//                 body: Wrapper(),
//               ),
//             ),
//           );
//         }
//         // Otherwise, show something whilst waiting for initialization to complete
//         return Loading();
//       },
//     );
//   }
// }

// class Loading extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Center(
//             child: Center(
//           child: CircularProgressIndicator(),
//         )),
//       ),
//     );
//   }
// }
