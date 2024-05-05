import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_test/main_container.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key});
  static const _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MainContainer(
        pageIndex: _pageIndex,
        child: Center(
            child: Text(
          "Top",
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        )));
  }
}
