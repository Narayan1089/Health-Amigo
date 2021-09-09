// @dart = 2.9
import 'package:amigoproject/app_screens/home_page.dart';
import 'package:amigoproject/providers/notes_provider.dart';
import 'package:amigoproject/providers/thoughts_provider.dart';
import 'package:amigoproject/services/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:amigoproject/services/auth.dart';

import 'app_screens/widget_screens/thoughts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
        // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
        // Check for errors
        if (snapshot.hasError) {
          return MaterialApp(
            // theme: ThemeData(
            //   textTheme: const TextTheme(
            //     headline1:
            //         TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            //   ),
            // ),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Column(
                  children: [Icon(Icons.error), Text("Something went wrong")],
                ),
              ),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              Provider<AuthMethods>(
                create: (_) => AuthMethods(),
              ),
              StreamProvider(
                create: (context) => context.read<AuthMethods>().authState,
                initialData: null,
              ),
              ChangeNotifierProvider(
                create: (_) => MoodClass(),
              ),
              ChangeNotifierProvider(
                create: (context) => NotesProviders(),
              ),
              ChangeNotifierProvider(
                create: (_) => ThoughtsProvider(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Wrapper(),
              ),
            ),
          );
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: Center(
          child: CircularProgressIndicator(),
        )),
      ),
    );
  }
}












// import 'package:amigoproject/app_screens/sos.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyApp createState() => _MyApp();
// }

// class _MyApp extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Loading();
//   }
// }

// class Loading extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       //  theme: ThemeData(
//       //   primarySwatch: Colors.pink,
//       //   backgroundColor: Colors.pink,
//       //   accentColor: Colors.deepPurple,
//       //   accentColorBrightness: Brightness.dark,
//       //   buttonTheme: ButtonTheme.of(context).copyWith(
//       //     buttonColor: Colors.pink,
//       //     textTheme: ButtonTextTheme.primary,
//       //     shape: RoundedRectangleBorder(
//       //       borderRadius: BorderRadius.circular(20),
//       //     ),
//       //   ),
//       // ),
//       // theme: ThemeData.dark(),
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: SOS(),
//       ),
//     );
//   }
// }






