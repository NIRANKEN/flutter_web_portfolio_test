import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_test/components/page_title.dart';
import 'package:flutter_web_portfolio_test/main_container.dart';
import 'package:flutter_web_portfolio_test/utils/display_utils.dart';

class WorksPage extends StatefulWidget {
  const WorksPage({super.key});

  @override
  WorksPageState createState() => WorksPageState();
}

class WorksPageState extends State<WorksPage>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(milliseconds: 1500),
    vsync: this,
  );
  late final Animation<double> _animation;
  int _pageIdx = 0;
  double _loadingPercentage = 0;
  bool _isAnimating = true;
  int _animationStartIdx = 0;

  @override
  void initState() {
    super.initState();

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    );

    _animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await _animate();
      }
    });
    _animationController.forward();

    _pageController.addListener(() {
      _animationController.reset();
      _animationController.forward();
    });
  }

  Future<void> _animate() async {
    for (int i = _animationStartIdx; i < 7; i++) {
      await Future.delayed(const Duration(seconds: 1));
      if (!_isAnimating) {
        return;
      }
      setState(() {
        if (i < 6) {
          _loadingPercentage = (i + 1) / 6;
        }
        _animationStartIdx = i + 1;
      });
    }
    setState(() {
      _pageIdx = (_pageIdx + 1) % 3;
      _loadingPercentage = 0;
      _animationStartIdx = 0;
    });
    _animationController.reset();
    _animationController.forward();
  }

  @override
  void dispose() {
    setState(() {
      _isAnimating = false;
    });
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(
        color: Theme.of(context).colorScheme.inversePrimary,
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const PageTitle(title: "Works"),
              _autoAnimationComponent(_workCards()[_pageIdx]),
              Container(
                margin: const EdgeInsets.all(16),
                child: LinearProgressIndicator(
                  value: _loadingPercentage,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                  backgroundColor: Colors.grey,
                ),
              )
            ],
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: IconButton(
                onPressed: () {
                  if (!_isAnimating) {
                    _animate();
                  }
                  setState(() {
                    _isAnimating = !_isAnimating;
                  });
                },
                icon: Icon(
                    _isAnimating ? Icons.pause_circle : Icons.play_circle,
                    color: Colors.white),
                style: ButtonStyle(
                  padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(16),
                  ),
                  iconSize: WidgetStateProperty.all<double>(32),
                )),
          )
        ]));
  }

  Widget _autoAnimationComponent(Widget child) {
    return SizeTransition(
        sizeFactor: _animation,
        axis: Axis.horizontal,
        axisAlignment: -1,
        child: child);
  }

  Widget _workCard(BuildContext context, String assetPath, String description) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Image.asset(assetPath,
              height: DisplayUtils.isLargeSize(context)
                  ? MediaQuery.of(context).size.height * 0.5
                  : MediaQuery.of(context).size.height * 0.4),
          const SizedBox(height: 16),
          Text(description,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: DisplayUtils.isLargeSize(context)
                      ? 28
                      : DisplayUtils.isMediumSize(context)
                          ? 24
                          : 18)),
        ],
      ),
    );
  }

  List<Widget> _workCards() {
    return [
      _workCard(context, "assets/images/works1.png",
          "[1/3] blenderをつかって3Dモデルを錬成して主にVRで遊んでいるよ。"),
      _workCard(context, "assets/images/works2.png",
          "[2/3] コードを書いてWebページやアプリも錬成しているよ。"),
      _workCard(context, "assets/images/works3.png",
          "[3/3] 足コントローラでゲームをプレイしたり、音声命令で麻雀を打ったりする変態さんだよ。"),
    ];
  }
}
