import 'package:get/get.dart';
import 'package:quiz_game/app/routes/app_pages.dart';

class SplashController extends GetxController {

  Future<void> navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offNamed(Routes.home); // Navigate to home page using GetX route management
  }
}
