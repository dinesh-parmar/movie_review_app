import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_review_app/screens/home.dart';
import 'package:movie_review_app/util/constants.dart';
import 'package:movie_review_app/util/routes.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const _minPortraitAspectRatio = 9 / 22;
  static const _maxPortraitAspectRatio = 9 / 16;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Flix",
      theme: darkTheme,
      navigatorKey: RM.navigate.navigatorKey,
      builder: (context, widget) {
        final mq = MediaQuery.of(context);
        final aspectRatio = mq.size.width / mq.size.height;
        return ResponsiveWrapper.builder(
          widget,
          defaultScale: true,
          maxWidth: aspectRatio > _maxPortraitAspectRatio || aspectRatio < _minPortraitAspectRatio ? mq.size.height * 9 / 19 : null,
          backgroundColor: Colors.black,
        );
      },
      onGenerateRoute: RM.navigate.onGenerateRoute(
        {
          Routes.home: (_) => const HomeScreen(),
        },
      ),
    );
  }
}
