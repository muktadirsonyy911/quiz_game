import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_game/app/commons/extensions/extension_num.dart';
import 'package:quiz_game/app/commons/services/score_storage.dart';
import 'package:quiz_game/app/commons/values/app_strings.dart';
import 'package:quiz_game/app/commons/widgets/app_bar_widget.dart';
import 'package:quiz_game/app/modules/history/controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(viewName: AppStrings.historyText),
      body: FutureBuilder<void>(
        future: controller.scoreStorage.init(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final scores = controller.scoreStorage.getScores();
            if (scores.isEmpty) {
              return  Center(
                child: Text(AppStrings.noScoreText),
              );
            }
            return ListView.builder(
              itemCount: scores.length,
              itemBuilder: (context, index) {
                final HistoryModel scoreEntry = scores[index];
                return Container(
                  margin: 10.allPadding,
                  decoration: BoxDecoration(color: Get.theme.canvasColor, borderRadius: 5.0.circularRadius, boxShadow: [
                    BoxShadow(
                      color: Get.theme.dividerColor.withOpacity(0.03),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ]),
                  child: ListTile(
                    title: Text('${AppStrings.dateText} ${scoreEntry.date.toString()}'),
                    subtitle: Text('${AppStrings.scoreText} ${scoreEntry.score}'),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
