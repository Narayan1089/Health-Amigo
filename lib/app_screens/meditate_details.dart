import 'package:flutter/material.dart';

class MeditateDetails extends StatefulWidget {
  const MeditateDetails({Key? key}) : super(key: key);

  @override
  _MeditateDetailsState createState() => _MeditateDetailsState();
}

class _MeditateDetailsState extends State<MeditateDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                // width: MediaQuery.of(context).h,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Image(
                      image: AssetImage('assets/images/smile_face.png'),
                      height: 101,
                      width: 101,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Happy? Check these Activities out",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 11.49),
                    ),
                    Text(
                      "and have some fun!",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 11.49),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: Color(0xffE5ECF1),
                ),
                height: 602,
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      // alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(50, 5, 50, 5),
                      padding: EdgeInsets.all(10),
                      width: 430, //364,
                      height: 69,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.91),
                        color: Colors.pinkAccent,
                      ),
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              'Earn Lots of Money',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.87),
                            ),
                          ),
                          SizedBox(
                            width: 75,
                          ),
                          Icon(
                            Icons.person,
                            size: 50,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
