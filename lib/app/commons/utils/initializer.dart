import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_game/app/commons/services/score_storage.dart';
import 'package:quiz_game/app/commons/utils/log_print.dart';

class Initializer {
  const Initializer._internal();

  static const Initializer instance = Initializer._internal();

  factory Initializer() => instance;

  void init(VoidCallback runApp) {
    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      HttpOverrides.global = MyHttpOverrides();
      FlutterError.onError = (details) {
        FlutterError.dumpErrorToConsole(details);
        LogPrint.msg(details.stack.toString());
      };
      await _initServices();
      runApp();
    }, (error, stack) {});
  }

  Future<void> _initServices() async {
    try {
      await _initStorage();
      _initScreenPreference();
    } catch (err) {
      rethrow;
    }
  }

  Future<void> _initStorage() async {
    await ScoreStorage().init();
  }

  void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
