import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_game/app/commons/services/score_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScoreStorage().init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}
