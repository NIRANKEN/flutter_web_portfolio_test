import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_test/main_container.dart';
import 'package:flutter_web_portfolio_test/utils/display_utils.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainContainer(
        color: Theme.of(context).colorScheme.inversePrimary,
        child: Column(children: [
          if (DisplayUtils.isMediumSize(context))
            Container(
              margin: const EdgeInsets.fromLTRB(32, 32, 32, 16),
              child: Text(
                "About",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: DisplayUtils.isLargeSize(context) ? 72 : 48),
              ),
            ),
          DisplayUtils.isMediumSize(context)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: _pictureAndSampleVoice(context),
                      ),
                      Flexible(
                          fit: FlexFit.loose, child: _contentsCard(context)),
                    ])
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      _pictureAndSampleVoice(context),
                      _contentsCard(context),
                    ])
        ]));
  }

  Widget _pictureAndSampleVoice(BuildContext context) {
    return SizedBox(
        // width: MediaQuery.of(context).size.width * 0.3,
        // height: MediaQuery.of(context).size.height * 0.5,
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: const FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text("にらんけん / NIRANKEN",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Image.asset("assets/images/profile.png",
                      width: DisplayUtils.isLargeSize(context)
                          ? 256
                          : DisplayUtils.isMediumSize(context)
                              ? 196
                              : MediaQuery.of(context).size.width * 0.25,
                      height: DisplayUtils.isLargeSize(context)
                          ? 256
                          : DisplayUtils.isMediumSize(context)
                              ? 196
                              : MediaQuery.of(context).size.width * 0.25,
                      fit: BoxFit.cover),
                  const SizedBox(height: 16),
                  _sampleVoiceButton(context, "サンプルボイス", () {}),
                ])));
  }

  Widget _contentsCard(BuildContext context) {
    const texts = [
      "インターネット空間で生息するために3D狼の肉体を錬成したおっさん。本人は孤高の一匹狼だと思っているが、実際は思いきや仕事だと思わないと話しかけられないコミュ障。",
      "好奇心の赴くままに色々なことにチャレンジしている様子は、狼というよりは猫に近い。",
    ];
    const subTexts = [
      "好きなゲーム💻: 原神, 雀魂, ボンバーマン, Civilization, PalWorld, FPS系(Apexなど)",
      "やりたいこと✨: おキャンプ, プログラミング雑談, カフェ店員ごっこ, ASMR(聴くほう)",
      "今後の目標🚩: 自分ならではの特技を作ること！それとコミュ障からの脱却。"
    ];
    return SizedBox(
      width: DisplayUtils.isMediumSize(context)
          ? MediaQuery.of(context).size.width * 0.5
          : MediaQuery.of(context).size.width * 0.9,
      child: Card(
          color: Colors.white,
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: DisplayUtils.isLargeSize(context)
                ? const EdgeInsets.all(32)
                : const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  texts.join("\n"),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: DisplayUtils.isLargeSize(context)
                          ? 20
                          : DisplayUtils.isMediumSize(context)
                              ? 16
                              : 12),
                ),
                DisplayUtils.isLargeSize(context)
                    ? const SizedBox(height: 32)
                    : const SizedBox(height: 16),
                Text(
                  subTexts.join("\n"),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: DisplayUtils.isLargeSize(context)
                          ? 18
                          : DisplayUtils.isMediumSize(context)
                              ? 14
                              : 10),
                ),
              ],
            ),
          )),
    );
  }

  Widget _sampleVoiceButton(
      BuildContext context, String text, Function() onPressed) {
    return Container(
        margin: const EdgeInsets.all(4),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.white),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            maximumSize: DisplayUtils.isLargeSize(context)
                ? const Size(184, 48)
                : Size(max(MediaQuery.of(context).size.width * 0.25, 120), 32),
            minimumSize: DisplayUtils.isLargeSize(context)
                ? const Size(184, 48)
                : Size(max(MediaQuery.of(context).size.width * 0.25, 120), 32),
          ),
          onPressed: onPressed,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(text,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: DisplayUtils.isLargeSize(context)
                            ? 16
                            : DisplayUtils.isMediumSize(context)
                                ? 14
                                : 10)),
                const SizedBox(width: 4),
                Icon(Icons.play_arrow,
                    color: Colors.white,
                    size: DisplayUtils.isMediumSize(context) ? 18 : 12),
              ]),
        ));
  }
}
