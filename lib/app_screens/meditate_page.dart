import 'package:amigoproject/app_screens/meditate_details.dart';
import 'package:flutter/material.dart';

class Meditate extends StatefulWidget {
//  const Meditate({required Key key}) : super(key: key);

  @override
  _MeditateState createState() => _MeditateState();
}

class _MeditateState extends State<Meditate> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              MoodCard('assets/images/smile_face.png', 'Happy'),
              MoodCard('assets/images/smile_face.png', 'Focus'),
              MoodCard('assets/images/smile_face.png', 'Anxiety'),
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
    );
  }
}

class MoodCard extends StatelessWidget {
  late final String? title;
  late final IconData? icon;
  late final String? image;

  MoodCard(img, title) {
    this.title = title;
    this.image = img;
  }
  // const MoodCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108.04,
      height: 124.88,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MeditateDetails()));
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
