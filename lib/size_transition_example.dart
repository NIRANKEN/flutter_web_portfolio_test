import 'package:flutter/material.dart';

class SizeTransitionContainer extends StatefulWidget {
  const SizeTransitionContainer(
      {super.key, required this.child, this.color = Colors.transparent});

  final Widget child;
  final Color color;

  @override
  State<SizeTransitionContainer> createState() =>
      _SizeTransitionContainerState();
}

class _SizeTransitionContainerState extends State<SizeTransitionContainer>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<double> _animation;
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isCompleted = true;
        });
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      body: SizeTransition(
        sizeFactor: _animation,
        axis: Axis.horizontal,
        axisAlignment: -1,
        child: widget.child,
      ),
    );
  }
}
