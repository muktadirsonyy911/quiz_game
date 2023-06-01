import 'package:flutter/material.dart';
import 'package:quiz_game/app/application.dart';
import 'package:quiz_game/app/commons/utils/initializer.dart';

void main() {
  Initializer.instance.init(() {
    runApp(const Application());
  });
}
