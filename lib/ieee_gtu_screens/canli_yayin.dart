import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:ui';

class YouTubeScreen extends StatefulWidget {
  final String videoId;

  YouTubeScreen({required this.videoId});

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
    final double videoHeight = screenHeight / 2;
    final double videoWidth = screenWidth / 2;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://picsum.photos/seed/picsum/200/300',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: videoHeight,
              width: videoWidth,
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
          Positioned(
            top: 50,
            right: 10,
            child: IconButton(
              icon: Icon(
                _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _isFullScreen = !_isFullScreen;
                });

                if (_isFullScreen) {
                  _controller.pause();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: Text('YouTube Video'),
                        ),
                        body: YoutubePlayerBuilder(
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
                  );
                } else {
                  _controller.play();
                  Navigator.of(context).pop();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}