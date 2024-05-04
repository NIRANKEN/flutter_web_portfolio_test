import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_test/title_button.dart';
import 'package:video_player/video_player.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final VideoPlayerController _videoController;
  late Future<void> _initializeVideoPlayerFuture;
  bool isLoading = true;
  bool isPlaying = false;
  bool isScrolling = false;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/videos/loading.mp4');
    _initializeVideoPlayerFuture =
        _videoController.initialize().then((_) => () {
              // setState(() {
              //   isPlaying = false;
              // });
              // _videoController.setLooping(true);
              // _videoController.play();
              // Future.delayed(const Duration(seconds: 2), () {
              //   _videoController.pause();
              //   setState(() {
              //     isLoading = false;
              //     isPlaying = false;
              //   });
              // });
            });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return isLoading
        ? _loadingWidget()
        : Scaffold(
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _titleContainer(context),
                    Expanded(
                      flex: 1,
                      child: ListView.separated(
                        padding: const EdgeInsets.all(16.0),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.9,
                            color: index % 2 == 0
                                ? Theme.of(context).colorScheme.background
                                : Theme.of(context).colorScheme.inversePrimary,
                            child: Center(
                              child: Text(
                                'Container $index',
                                style: TextStyle(
                                    color: index % 2 == 0
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondary
                                        : Colors.white),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(width: 16.0),
                        // scrollable
                        scrollDirection: Axis.vertical,
                      ),
                    )
                  ]),
            ),
          );
  }

  Widget _loadingWidget() {
    return Scaffold(
        body: Center(
            child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    _videoController.play();
                    Future.delayed(const Duration(seconds: 6), () {
                      _videoController.pause();
                      setState(() {
                        isLoading = false;
                        isPlaying = false;
                      });
                    });
                    return Container(
                        padding: const EdgeInsets.all(16.0),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: AspectRatio(
                          aspectRatio: _videoController.value.aspectRatio,
                          child: VideoPlayer(_videoController),
                        ));
                  } else {
                    return const CircularProgressIndicator();
                  }
                }))
        // body: Center(
        //   child: _videoController.value.isInitialized && isPlaying
        //       ? AspectRatio(
        //           aspectRatio: _videoController.value.aspectRatio,
        //           child: VideoPlayer(_videoController))
        //       : Container(),
        // ),
        );
  }

  Widget _titleContainer(BuildContext context) {
    return Stack(children: [
      Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text('Title',
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
              const TitleButton(title: "Top"),
              const SizedBox(width: 16.0),
              const TitleButton(title: "About"),
              const SizedBox(width: 16.0),
              const TitleButton(title: "Contact"),
              const SizedBox(width: 16.0),
            ],
          ))
    ]);
  }
}
