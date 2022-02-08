import 'package:flutter/material.dart';
import 'package:movie_review_app/screens/splash_screen.dart';

void main() async {
  runApp(const SplashHandler());
}

class SplashHandler extends StatelessWidget {
  const SplashHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Flix',
      theme: ThemeData(primaryColor: Colors.white),
      home: const SplashScreen(),
    );
  }
}
