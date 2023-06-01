import 'package:logger/logger.dart';

class LogPrint {

  static void msg(dynamic errorMsg, [error, stackTrace]) {
    //if (Get.find<AppController>().isReleaseMode) return;

    Logger(printer: PrettyPrinter(methodCount: 0, errorMethodCount: 0)).v(
      errorMsg,
      error,
      stackTrace,
    );
  }
}
