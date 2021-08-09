import 'package:amigoproject/services/video_player/chewie_list_item.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class GuidedTracks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: ListView(
        children: <Widget>[
          ChewieListItem(
            videoPlayerController: VideoPlayerController.network(
              'https://static.videezy.com/system/resources/previews/000/051/600/original/Parmak_ve_Balon_Baligi.mp4',
            ),
            looping: true,
          ),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.network(
              'https://static.videezy.com/system/resources/previews/000/008/446/original/Dark_Haired_Girl_in_disbelief_2.mp4',
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
