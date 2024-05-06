import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_test/constants.dart';
import 'my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'やぁ',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Constants.mainColor),
          useMaterial3: true,
          fontFamily: 'Noto Sans JP'),
      home: const MyHomePage(title: 'べっ、別にポートフォリオじゃないんだからね！'),
    );
  }
}
