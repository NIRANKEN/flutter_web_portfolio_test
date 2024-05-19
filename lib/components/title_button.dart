import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_test/utils/display_utils.dart';

class TitleButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  const TitleButton({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.transparent),
          padding: DisplayUtils.isMediumSize(context)
              ? const EdgeInsets.symmetric(horizontal: 32, vertical: 16)
              : const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
      child: Text(title,
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: DisplayUtils.isMediumSize(context) ? 18.0 : 14.0)),
    );
  }
}
