import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_test/utils/display_utils.dart';

class SnsCard extends StatelessWidget {
  final String imageAssetUrl;

  const SnsCard({super.key, required this.imageAssetUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Image.asset(imageAssetUrl,
            width: DisplayUtils.isLargeSize(context)
                ? min(32, MediaQuery.of(context).size.width * 0.1)
                : min(24, MediaQuery.of(context).size.width * 0.1),
            height: DisplayUtils.isLargeSize(context)
                ? min(32, MediaQuery.of(context).size.width * 0.1)
                : min(24, MediaQuery.of(context).size.width * 0.1),
            fit: BoxFit.fitWidth),
      ),
    );
  }
}
