import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      ),
      child: Text(title,
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary, fontSize: 18)),
    );
  }
}
