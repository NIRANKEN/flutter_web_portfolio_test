import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_test/main_container.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainContainer(
        color: Colors.white,
        child: Center(
            child: Text(
          "Contact",
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary, fontSize: 64),
        )));
  }
}
