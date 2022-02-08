import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_review_app/gen/assets.gen.dart';
import 'package:movie_review_app/util/constants.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../myapp.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(2.seconds, () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const MyApp())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(child: Lottie.asset(Assets.animations.splashScreen)),
    );
  }
}
