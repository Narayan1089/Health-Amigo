import 'package:amigoproject/services/initial_builder.dart';
import 'package:amigoproject/services/video_player/guided_tracks.dart';
import 'package:flutter/material.dart';

class Meditate extends StatefulWidget {
//  const Meditate({required Key key}) : super(key: key);

  @override
  _MeditateState createState() => _MeditateState();
}

class _MeditateState extends State<Meditate> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Amigo()));
        return true;
      },
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 64,
            ),
            Text(
              'Soothing - To Calm Your Soul',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 14.87),
            ),
            SizedBox(
              height: 36,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     CircleAvatar(
            //       radius: 25,
            //       child: Image(
            //         image: AssetImage('assets/images/yoga.png'),
            //       ),
            //     ),
            //     CircleAvatar(
            //       radius: 25,
            //       child: Image(
            //         image: AssetImage('assets/images/yoga.png'),
            //       ),
            //     ),
            //     CircleAvatar(
            //       radius: 25,
            //       child: Image(
            //         image: AssetImage('assets/images/yoga.png'),
            //       ),
            //     ),
            //     CircleAvatar(
            //       radius: 25,
            //       child: Image(
            //         image: AssetImage('assets/images/yoga.png'),
            //       ),
            //     ),
            //     CircleAvatar(
            //       radius: 25,
            //       child: Image(
            //         image: AssetImage('assets/images/yoga.png'),
            //       ),
            //     ),
            //     CircleAvatar(
            //       radius: 25,
            //       child: Image(
            //         image: AssetImage('assets/images/yoga.png'),
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 60,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // MoodCard('assets/images/smile_face.png', 'Happy'),
                MoodCard('assets/images/smile_face.png', 'Sleep',
                    'https://static.videezy.com/system/resources/previews/000/008/445/original/Dark_Haired_Girl_in_disbelief_1.mp4'),
                MoodCard('assets/images/smile_face.png', 'Sleep',
                    'https://static.videezy.com/system/resources/previews/000/008/445/original/Dark_Haired_Girl_in_disbelief_1.mp4'),
                // MoodCard('assets/images/smile_face.png', 'Anxiety',
                //     'assets/videos/GT2new.mp4'),
                // 'https://drive.google.com/drive/u/0/folders/1Q--ZrD9GxyCx6ROBIUlFXlzo7hrGChqx'),
              ],
            ),
            // SizedBox(
            //   height: 5,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     MoodCard('assets/images/smile_face.png', 'Stress'),
            //     MoodCard('assets/images/smile_face.png', 'Angry'),
            //     MoodCard('assets/images/smile_face.png', 'Sad'),
            //   ],
            // ),
            SizedBox(
              height: 60,
            ),
            Text(
              'Tell us about how you\'re feeling',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 11.49),
            ),
            Text(
              'today?',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 11.49),
            ),
          ],
        ),
      ),
    );
  }
}

class MoodCard extends StatelessWidget {
  late final String? title;
  late final IconData? icon;
  late final String? image;
  late final String? url;

  MoodCard(img, title, String s) {
    this.title = title;
    this.image = img;
    this.url = s;
  }
  // const MoodCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108.04,
      height: 124.88,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GuidedTracks(
                        url: url,
                      )));
        },
        child: Card(
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 5,
              ),
              Image(
                image: AssetImage(image.toString()),
                height: 58,
                width: 58,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                title.toString(),
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: 14.87),
              )
            ],
          ),
        ),
      ),
    );
  }
}
