import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class Comments extends StatefulWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CircleAvatar(
                  //   radius: 23.5,
                  //   child: Icon(
                  //     Icons.account_box,
                  //     size: 47,
                  //   ),
                  // ),
                  Icon(
                    Icons.account_box,
                    size: 47,
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(5),
                    color: Color(0xffF4F4F4),
                    width: 321,
                    height: 170,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Username',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
                            )),
                        Text('xx minutes ago',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
                            )),
                        SizedBox(
                          height: 7,
                        ),
                        ReadMoreText(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy ",
                          trimLines: 3,
                          style: TextStyle(color: Colors.black),
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'READ MORE',
                          trimExpandedText: 'READ LESS',
                          moreStyle: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                          lessStyle: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        // Text(
                        //     ""),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // SizedBox(
                            //   width: 60,
                            // ),
                            Icon(Icons.thumb_up_alt_outlined),
                            SizedBox(width: 5),
                            Text('0'),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.thumb_down_alt_outlined),
                            SizedBox(width: 5),
                            Text('2'),
                            SizedBox(
                              width: 90,
                            ),
                            Icon(Icons.flag),
                            SizedBox(
                              width: 20,
                            ),
                            Text('REPLY')
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
