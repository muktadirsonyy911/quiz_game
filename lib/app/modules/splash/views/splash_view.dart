import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_game/app/commons/values/app_assets.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.navigateToHome();
    return Scaffold(
      body: Center(
        child: Lottie.asset(AppAssets.lottie.quizLottie),
      ),
    );
  }
}
