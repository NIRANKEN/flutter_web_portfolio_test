import 'package:flutter/material.dart';

class DisplayUtils {
  static bool isExtraLarge(BuildContext context) {
    return MediaQuery.of(context).size.width > 1920 &&
        MediaQuery.of(context).size.height > 1080;
  }

  static bool isLargeSize(BuildContext context) {
    return MediaQuery.of(context).size.width > 1024 &&
        MediaQuery.of(context).size.height > 768;
  }

  static bool isMediumSize(BuildContext context) {
    return isMediumWidth(context) && MediaQuery.of(context).size.height > 540;
  }

  static bool isMediumWidth(BuildContext context) {
    return MediaQuery.of(context).size.width > 820;
  }
}
