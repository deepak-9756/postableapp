import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoPost extends StatefulWidget {
  const VideoPost({super.key});

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  VideoPlayerController? _videoPlayerController;
  final String videopath = "assets/images/SampleVideo_1280x720_1mb.mp4";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(videopath)
      ..initialize();
    setState(() {});
    _videoPlayerController?.play();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: AspectRatio(
                aspectRatio: 1.0, child: VideoPlayer(_videoPlayerController!)),
          ),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Sample Video Post",
            ),
          ),

          // Share button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Share this Video"),
                IconButton(
                  onPressed: () {
                    Share.share(
                        "https://super-hamster-cf491e.netlify.app/?code=video");
                  },
                  icon: const Icon(Icons.share),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
