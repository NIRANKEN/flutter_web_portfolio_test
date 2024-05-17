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
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text("それっぽい感じの",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        // fontSize: 128
                      )),
                ),
              ),
            ]),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text("ポートフォリオかも",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ))),
                ),
              ],
            ),
          ],
        ));
  }
}
