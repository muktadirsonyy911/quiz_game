import 'package:get/get.dart';
import 'package:quiz_game/app/routes/app_pages.dart';

class HomeController extends GetxController {


  void onStartQuizTap() {
    Get.toNamed(Routes.quiz);
  }

  void onViewHistoryTap() {
    Get.toNamed(Routes.history);
  }
}
