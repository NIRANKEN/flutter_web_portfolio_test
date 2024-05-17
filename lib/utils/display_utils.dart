import 'package:flutter/material.dart';

class DisplayUtils {
  static bool isLargeSize(BuildContext context) {
    return MediaQuery.of(context).size.width > 1024 &&
        MediaQuery.of(context).size.height > 768;
  }

  static bool isMediumSize(BuildContext context) {
    return MediaQuery.of(context).size.width > 820 &&
        MediaQuery.of(context).size.height > 540;
  }
}
