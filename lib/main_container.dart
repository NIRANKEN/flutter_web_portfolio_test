import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_test/utils/display_utils.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({
    super.key,
    required this.child,
    this.color = Colors.transparent,
  });

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.9,
      margin: DisplayUtils.isLargeSize(context)
          ? const EdgeInsets.all(64)
          : const EdgeInsets.all(32),
      color: color,
      child: child,
    );
  }
}
