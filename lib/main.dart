import 'package:flutter/material.dart';
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
      title: 'にらんけんの巣窟',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 125, 114, 134)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'にらんけんの巣窟'),
    );
  }
}
