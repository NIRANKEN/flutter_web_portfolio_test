import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_test/main_container.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainContainer(
        color: Theme.of(context).colorScheme.inversePrimary,
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(32),
                child: const Text(
                  "About",
                  style: TextStyle(color: Colors.white, fontSize: 72),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: _pictureAndSampleVoice(context),
                    ),
                    Flexible(fit: FlexFit.loose, child: _contentsCard(context)),
                  ])
            ]));
  }

  Widget _pictureAndSampleVoice(BuildContext context) {
    return SizedBox(
        // width: MediaQuery.of(context).size.width * 0.3,
        // height: MediaQuery.of(context).size.height * 0.5,
        child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("にらんけん / NIRANKEN",
                      style: TextStyle(color: Colors.white, fontSize: 40)),
                  const SizedBox(height: 32),
                  Image.asset("assets/images/profile.png",
                      width: 256, height: 256, fit: BoxFit.cover),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _sampleVoiceButton("サンプルボイス1", () {}),
                      const SizedBox(width: 16),
                      _sampleVoiceButton("サンプルボイス2", () {}),
                      const SizedBox(width: 16),
                      _sampleVoiceButton("サンプルボイス3", () {}),
                    ],
                  ),
                ])));
  }

  Widget _contentsCard(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Card(
          color: Colors.white,
          margin: const EdgeInsets.all(64),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Text(
              "This is a portfolio site.\n こんにちは、ポートフォリオサイトです。\n ",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 26),
            ),
          )),
    );
  }

  Widget _sampleVoiceButton(String text, Function() onPressed) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.white),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      onPressed: onPressed,
      child: Row(children: [
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 16)),
        const SizedBox(width: 4),
        const Icon(Icons.play_arrow, color: Colors.white),
      ]),
    );
  }
}
