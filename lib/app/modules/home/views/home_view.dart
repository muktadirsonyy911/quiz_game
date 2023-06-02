import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_game/app/commons/extensions/extension_num.dart';
import 'package:quiz_game/app/commons/values/app_strings.dart';
import 'package:quiz_game/app/commons/widgets/custom_container_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomContainerWidget(title: AppStrings.startQuizText, onTap: controller.onStartQuizTap),
            (Get.width * 0.1).verticalSpace,
            CustomContainerWidget(title: AppStrings.viewHistoryText, onTap: controller.onViewHistoryTap),
          ],
        ),
      ),
    );
  }
}
