import 'package:amigoproject/services/video_player/chewie_list_item.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class GuidedTracks extends StatelessWidget {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  dynamic url;

  GuidedTracks({required this.url});

  Future<dynamic> listExample() async {
    String downloadURL = '';
    firebase_storage.ListResult result = await firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('video_tracks')
        .listAll();

    result.items.forEach((firebase_storage.Reference ref) async {
      // debugPrint('Found file: $ref');
      downloadURL = await firebase_storage.FirebaseStorage.instance
          .ref(ref.fullPath)
          .getDownloadURL();
      // return downloadURL;
      // debugPrint("Video URL: " + downloadURL.toString());

      // Image.network(downloadURL);
    });
    return downloadURL;

    // result.prefixes.forEach((firebase_storage.Reference ref) {
    //   debugPrint('Found directory: $ref');
    // });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   listExample();
  // }

  // Future<void> downloadURLExample() async {
  //   String downloadURL = await firebase_storage.FirebaseStorage.instance
  //       .ref('/Guided Tracks/Guided track.mp4')
  //       .getDownloadURL();

  //   // Within your widgets:
  //   // Image.network(downloadURL);
  // }

  @override
  Widget build(BuildContext context) {
    // listExample();
    // url = listExample().toString;
    debugPrint("Url: " + url.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: Text('Video Player'),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15),
          // ChewieListItem(
          //   videoPlayerController: VideoPlayerController.asset(
          //     'assets/videos/GT1.mp4',
          //   ),
          //   looping: true,
          // ),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.network(
              url.toString(),
              // listExample().toString()
            ),
            looping: true,
          ),
          // ChewieListItem(
          //   // This URL doesn't exist - will display an error
          //   videoPlayerController: VideoPlayerController.network(
          //     'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/error.mp4',
          //   ),
          //   looping: true,
          // ),
        ],
      ),
    );
  }
}
