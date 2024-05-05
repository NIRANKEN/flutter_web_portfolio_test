import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_test/main_container.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
  static const _pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return const MainContainer(
        pageIndex: _pageIndex,
        child: Center(
            child: Text(
          "About",
          style: TextStyle(color: Colors.white),
        )));
  }
}
