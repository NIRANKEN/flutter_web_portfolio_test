import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_test/main_container.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainContainer(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [
              const SizedBox(width: 64),
              Text("それっぽい感じの",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 128)),
            ]),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("ポートフォリオかも",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 128)),
              ],
            ),
          ],
        ));
  }
}
