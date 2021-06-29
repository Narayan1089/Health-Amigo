import 'package:amigoproject/app_screens/blog_details_pg.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Blogs extends StatefulWidget {
//  const Blogs({Key key}) : super(key: key);

  @override
  _BlogsState createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ListTile(
              title: Text('Blogs'),
              subtitle: Text('Feeling Happy or Sad? Vent it out with us.'),
            ),
            GestureDetector(
              child: Card(
                child: Column(
                  children: [
                    Icon(
                      Icons.home,
                      size: 200,
                    ),
                    FittedBox(
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      child: Text('The OCD Stories'),
                    )
                  ],
                ),
              ),
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BlogDetails()))
              },
            ),
            // StaggeredGridView.countBuilder(
            //   crossAxisCount: 4,
            //   itemCount: 1,
            //   itemBuilder: (BuildContext context, int index) {
            //     return GestureDetector(
            //       child: Card(
            //         child: Column(
            //           children: [
            //             Icon(
            //               Icons.home,
            //               size: 200,
            //             ),
            //             FittedBox(
            //               fit: BoxFit.contain,
            //               alignment: Alignment.center,
            //               child: Text('The OCD Stories'),
            //             )
            //           ],
            //         ),
            //       ),
            //       onTap: () => {
            //         Navigator.push(context,
            //             MaterialPageRoute(builder: (context) => BlogDetails()))
            //       },
            //     );
            //   },
            //   staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
            //   mainAxisSpacing: 4.0,
            //   crossAxisSpacing: 4.0,
            // )
          ],
        ),
      ),
    );
  }
}
