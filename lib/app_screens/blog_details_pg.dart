import 'package:amigoproject/app_screens/blog_comments.dart';
import 'package:flutter/material.dart';
import 'blog.dart';

class BlogDetails extends StatefulWidget {
  // const BlogDetails({Key key}) : super(key: key);
  Blog blog;
  BlogDetails({required this.blog});
  @override
  _BlogDetailsState createState() => _BlogDetailsState(blog: blog);
}

class _BlogDetailsState extends State<BlogDetails> {
  Blog blog;
  _BlogDetailsState({required this.blog});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(5, 30, 5, 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: AssetImage('assets/images/test.png')),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        blog.title,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 26.67,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text('Date\tTime\t-Author-${blog.author} '),
                          SizedBox(
                            width: 140,
                          ),
                          Icon(Icons.share_outlined),
                          SizedBox(
                            width: 30,
                          ),
                          GestureDetector(
                              child: Icon(Icons.comment),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Comments()));
                              })
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w300,
                              // height: 27
                            ),
                            text: blog.text),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Colors.white,
        //   onPressed: () {},
        //   child: Icon(Icons.add, color: Color(0xffFF834F)),
        // ),
      ),
    );
  }
}
