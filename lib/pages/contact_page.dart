import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_test/main_container.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});
  static const _pageIndex = 2;

  @override
  Widget build(BuildContext context) {
    return MainContainer(
        pageIndex: _pageIndex,
        child: Center(
            child: Text(
          "Contact",
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        )));
  }
}
