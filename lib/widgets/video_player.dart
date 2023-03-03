
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoPath; // the path of the video file to play
  //VideoPlayerScreen({Key key, @required this.videoPath}) : super(key: key);
  VideoPlayerScreen(this.videoPath);
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  // initialize the VideoPlayerController and FlickManager
  late VideoPlayerController _controller;
  late FlickManager _flickManager;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoPath);
    //  VideoPlayerController.asset(widget.videoPath);
    _flickManager = FlickManager(
      videoPlayerController: _controller,
    );
  }

  @override
  void dispose() {
    _flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Center(
        child: FlickVideoPlayer(
          flickManager: _flickManager,
          preferredDeviceOrientationFullscreen: [
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ],
        ),
      ),
    );
  }
}
// class DefaultPlayer extends StatefulWidget {
//   DefaultPlayer({Key? key}) : super(key: key);
//
//   @override
//   _DefaultPlayerState createState() => _DefaultPlayerState();
// }
//
// class _DefaultPlayerState extends State<DefaultPlayer> {
//   late FlickManager flickManager;
//   @override
//   void initState() {
//     super.initState();
//     flickManager = FlickManager(
//       videoPlayerController:
//       VideoPlayerController.asset("assets/videos/sample_video1.mp4")
//       // VideoPlayerController.network(
//       //   "https://www.pexels.com/video/view-of-sunset-from-the-beach-5147455/",
//       //   closedCaptionFile: _loadCaptions(),
//      // ),
//     );
//   }
//
//   ///If you have subtitle assets
//   Future<ClosedCaptionFile> _loadCaptions() async {
//     final String fileContents = await DefaultAssetBundle.of(context)
//         .loadString('images/bumble_bee_captions.srt');
//     flickManager.flickControlManager!.toggleSubtitle();
//     return SubRipCaptionFile(fileContents);
//   }
//
//   ///If you have subtitle urls
//   // Future<ClosedCaptionFile> _loadCaptions() async {
//   //   final url = Uri.parse('SUBTITLE URL LINK');
//   //   try {
//   //     final data = await http.get(url);
//   //     final srtContent = data.body.toString();
//   //     print(srtContent);
//   //     return SubRipCaptionFile(srtContent);
//   //   } catch (e) {
//   //     print('Failed to get subtitles for ${e}');
//   //     return SubRipCaptionFile('');
//   //   }
//   //}
//
//   @override
//   void dispose() {
//     flickManager.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return VisibilityDetector(
//       key: ObjectKey(flickManager),
//       onVisibilityChanged: (visibility) {
//         if (visibility.visibleFraction == 0 && this.mounted) {
//           flickManager.flickControlManager?.autoPause();
//         } else if (visibility.visibleFraction == 1) {
//           flickManager.flickControlManager?.autoResume();
//         }
//       },
//       child: Container(
//         child: FlickVideoPlayer(
//           flickManager: flickManager,
//           flickVideoWithControls: FlickVideoWithControls(
//             closedCaptionTextStyle: TextStyle(fontSize: 8),
//             controls: FlickPortraitControls(),
//           ),
//           flickVideoWithControlsFullscreen: FlickVideoWithControls(
//             controls: FlickLandscapeControls(),
//           ),
//         ),
//       ),
//     );
//   }
// }
/*
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class DefaultPlayer extends StatefulWidget {
  const DefaultPlayer({Key? key}) : super(key: key);

  @override
  State<DefaultPlayer> createState() => _DefaultPlayerState();
}

class _DefaultPlayerState extends State<DefaultPlayer> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
      VideoPlayerController.network("https://www.youtube.com/watch?v=PjfP2tmjtQM"),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlickVideoPlayer(
          flickManager: flickManager
      ),
    );
  }
}
*/
