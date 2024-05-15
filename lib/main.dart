import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_test/constants.dart';
import 'my_home_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

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
