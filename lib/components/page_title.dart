import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_test/utils/display_utils.dart';

class PageTitle extends StatelessWidget {
  final String title;
  final Color color;

  const PageTitle({super.key, required this.title, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: DisplayUtils.isMediumWidth(context)
          ? const EdgeInsets.fromLTRB(32, 32, 32, 16)
          : const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: TextStyle(
            color: color,
            fontSize: DisplayUtils.isLargeSize(context)
                ? 72
                : DisplayUtils.isMediumSize(context)
                    ? 48
                    : 24),
      ),
    );
  }
}
