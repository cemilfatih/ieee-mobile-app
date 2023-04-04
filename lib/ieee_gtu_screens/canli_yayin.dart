import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:ieee_mobile_app/helper/helper.dart';
import 'dart:ui';

class YouTubeScreen extends StatefulWidget {
  final String videoId = Helper.liveEventID;
  YouTubeScreen();

  @override
  _YouTubeScreenState createState() => _YouTubeScreenState();
}

class _YouTubeScreenState extends State<YouTubeScreen> {
  late YoutubePlayerController _controller;
  bool _isFullScreen = false;

  @override
  void initState() {

    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        showLiveFullscreenButton: false,
         hideControls: true,
        enableCaption: true,
        loop: true,

      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double videoHeight = screenHeight / 1.2;
    final double videoWidth = screenWidth / 1.2;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          Center(
            child: RotatedBox(quarterTurns: 1,
              child: SizedBox(
                height: videoWidth,
                width:videoHeight,
                child: YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: _controller,
                    onReady: () {},
                  ),
                  builder: (context, player) {
                    return player;
                  },
                ),
              ),
            ),
          ),
          // Positioned(
          //   top: 50,
          //   right: 10,
          //   child: IconButton(
          //     icon: Icon(
          //       _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {
          //       setState(() {
          //         _isFullScreen = !_isFullScreen;
          //       });
          //
          //       if (_isFullScreen) {
          //         _controller.pause();
          //         Navigator.of(context).push(
          //           MaterialPageRoute(
          //             builder: (context) => Scaffold(
          //               appBar: AppBar(
          //                 title: Text('YouTube Video'),
          //               ),
          //               body: YoutubePlayerBuilder(
          //                 player: YoutubePlayer(
          //                   controller: _controller,
          //                   onReady: () {},
          //                 ),
          //                 builder: (context, player) {
          //                   return player;
          //                 },
          //               ),
          //             ),
          //           ),
          //         );
          //       } else {
          //         _controller.play();
          //         Navigator.of(context).pop();
          //       }
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}