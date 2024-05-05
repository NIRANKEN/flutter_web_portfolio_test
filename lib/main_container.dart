import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  const MainContainer(
      {super.key, required this.child, required this.pageIndex});

  final Widget child;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.9,
      color: pageIndex % 2 == 0
          ? Theme.of(context).colorScheme.background
          : Theme.of(context).colorScheme.inversePrimary,
      child: child,
    );
  }
}
