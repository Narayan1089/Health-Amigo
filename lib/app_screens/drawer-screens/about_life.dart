import 'package:flutter/material.dart';

class AboutInfo extends StatelessWidget {
  const AboutInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: AlignmentGeometry.lerp(a, b, t),
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: 400,
      height: 220,
      padding: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: Color(0xffE5E5E5), borderRadius: BorderRadius.circular(10)),
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
        ],
      ),
    );
  }
}
