import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_test/background_custom_paint.dart';
import 'package:flutter_web_portfolio_test/pages/about_page.dart';
import 'package:flutter_web_portfolio_test/pages/contact_page.dart';
import 'package:flutter_web_portfolio_test/pages/top_page.dart';
import 'package:flutter_web_portfolio_test/title_button.dart';
import 'package:flutter_web_portfolio_test/utils/display_utils.dart';
import 'package:video_player/video_player.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final VideoPlayerController _videoController;
  late Future<void> _initializeVideoPlayerFuture;
  bool isLoading = true;
  bool isPlaying = false;
  bool isScrolling = false;

  final PageController _pageController = PageController(
    initialPage: 0,
  );
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(milliseconds: 1500),
    vsync: this,
  );
  late final Animation<double> _animation;
  bool isAnimationCompleted = false;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/videos/loading.mp4');
    _initializeVideoPlayerFuture = _videoController.initialize();
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isAnimationCompleted = true;
        });
      }
    });
    _animationController.forward();

    _pageController.addListener(() {
      // ページが変更されたときに、アニメーションを再生する
      _animationController.reset();
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _videoController.dispose();
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? _loadingWidget()
        : Scaffold(
            body: Stack(children: [
              const BackgroundCustomPaint(),
              Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _titleContainer(context),
                      Expanded(
                          flex: 1,
                          child: SizeTransition(
                              sizeFactor: _animation,
                              axis: Axis.horizontal,
                              axisAlignment: -1,
                              child: PageView(
                                  controller: _pageController,
                                  scrollDirection: Axis.vertical,
                                  children: const [
                                    TopPage(),
                                    AboutPage(),
                                    ContactPage(),
                                  ])))
                    ]),
              ),
            ]),
          );
  }

  Widget _loadingWidget() {
    return Scaffold(
        body: Center(
            child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    _videoController.setLooping(true);
                    _videoController.setVolume(0.0);
                    _videoController.play();
                    Future.delayed(const Duration(seconds: 3), () {
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
                })));
  }

  Widget _titleContainer(BuildContext context) {
    return Stack(children: [
      Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  widget.title,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: DisplayUtils.isLargeSize(context)
                          ? 32.0
                          : DisplayUtils.isMediumSize(context)
                              ? 24.0
                              : 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TitleButton(
                  title: "Top",
                  onPressed: () {
                    _pageController.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.ease,
                    );
                  }),
              DisplayUtils.isMediumSize(context)
                  ? const SizedBox(width: 16.0)
                  : const SizedBox(width: 8.0),
              TitleButton(
                  title: "About",
                  onPressed: () {
                    _pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.ease,
                    );
                  }),
              DisplayUtils.isMediumSize(context)
                  ? const SizedBox(width: 16.0)
                  : const SizedBox(width: 8.0),
              TitleButton(
                  title: "Contact",
                  onPressed: () {
                    _pageController.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.ease,
                    );
                  }),
              DisplayUtils.isMediumSize(context)
                  ? const SizedBox(width: 16.0)
                  : const SizedBox(width: 8.0),
            ],
          ))
    ]);
  }
}
