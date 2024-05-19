import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_test/utils/display_utils.dart';
import 'package:just_audio/just_audio.dart';

class SampleVoiceButton extends StatefulWidget {
  const SampleVoiceButton({super.key});

  @override
  SampleVoiceButtonState createState() => SampleVoiceButtonState();
}

class SampleVoiceButtonState extends State<SampleVoiceButton> {
  late final AudioPlayer _audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setAsset('assets/voices/niranken.mp3');
  }

  @override
  void dispose() {
    if (isPlaying) {
      _audioPlayer.stop();
    }
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(4),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: isPlaying
                ? const BorderSide(color: Colors.grey)
                : const BorderSide(color: Colors.white),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            maximumSize: DisplayUtils.isLargeSize(context)
                ? const Size(184, 48)
                : Size(max(MediaQuery.of(context).size.width * 0.25, 120), 32),
            minimumSize: DisplayUtils.isLargeSize(context)
                ? const Size(184, 48)
                : Size(max(MediaQuery.of(context).size.width * 0.25, 120), 32),
          ),
          onPressed: isPlaying
              ? null
              : () {
                  _audioPlayer.play().whenComplete(() {
                    setState(() {
                      isPlaying = false;
                    });
                  });
                  setState(() {
                    isPlaying = true;
                  });
                },
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(isPlaying ? "再生中..." : "サンプルボイス",
                    style: TextStyle(
                        color: isPlaying ? Colors.grey : Colors.white,
                        fontSize: DisplayUtils.isLargeSize(context)
                            ? 16
                            : DisplayUtils.isMediumSize(context)
                                ? 14
                                : 10)),
                const SizedBox(width: 4),
                Icon(Icons.play_arrow,
                    color: isPlaying ? Colors.grey : Colors.white,
                    size: DisplayUtils.isMediumSize(context) ? 18 : 12),
              ]),
        ));
  }
}
