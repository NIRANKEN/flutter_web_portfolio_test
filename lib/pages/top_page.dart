import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_test/main_container.dart';
import 'package:flutter_web_portfolio_test/utils/display_utils.dart';
import 'package:video_player/video_player.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => TopPageState();
}

class TopPageState extends State<TopPage> {
  late final VideoPlayerController _videoController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/videos/intro.mp4');
    _initializeVideoPlayerFuture = _videoController.initialize();
  }

  // Future<void> _initializeVideoPlayer() async {
  //   await _videoController.initialize();
  //   await Future.delayed(const Duration(seconds: 1));
  // }

  @override
  dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text("Flutter Webでつくったよ。",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary)),
                  ),
                ),
                _introMovieWidget(),
              ],
            ),
          ],
        ));
  }

  Widget _introMovieWidget() {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          _videoController.setLooping(true);
          _videoController.setVolume(0.0);
          _videoController.pause();
          _videoController.play();
          return Container(
              padding: const EdgeInsets.all(16.0),
              width: DisplayUtils.isMediumWidth(context)
                  ? MediaQuery.of(context).size.width * 0.5
                  : MediaQuery.of(context).size.width * 0.8,
              // height: DisplayUtils.isMediumSize(context)
              //     ? MediaQuery.of(context).size.height * 0.5
              //     : MediaQuery.of(context).size.height * 0.8,
              child: AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              ));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
