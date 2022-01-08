import 'package:flutter/material.dart';
import 'package:movie_review_app/screens/home.dart';
import 'package:movie_review_app/util/constants.dart';
import 'package:movie_review_app/util/routes.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      navigatorKey: RM.navigate.navigatorKey,
      onGenerateRoute: RM.navigate.onGenerateRoute(
        {
          Routes.home: (_) => const HomeScreen(),
        },
      ),
    );
  }
}
