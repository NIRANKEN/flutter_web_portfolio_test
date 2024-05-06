import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_test/main_container.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainContainer(
        color: Theme.of(context).colorScheme.inversePrimary,
        child: const Center(
            child: Text(
          "About",
          style: TextStyle(color: Colors.white, fontSize: 64),
        )));
  }
}
