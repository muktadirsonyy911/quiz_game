import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_game/app/commons/extensions/extension_num.dart';
import 'package:quiz_game/app/commons/styles/text_style.dart';
import 'package:quiz_game/app/commons/values/app_colors.dart';
import 'package:quiz_game/app/commons/values/app_strings.dart';
import 'package:quiz_game/app/commons/widgets/app_bar_widget.dart';
import 'package:quiz_game/app/commons/widgets/custom_button_widget.dart';
import 'package:quiz_game/app/modules/quiz/models/quiz_response_model.dart';
import 'package:quiz_game/app/modules/result/controllers/result_controller.dart';

class ResultView extends GetView<ResultController> {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(viewName: AppStrings.resultText),
      body: Container(
        padding: 15.allPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                '(${controller.totalCorrectAnswers} ${AppStrings.outOfText} ${controller.quizController.selectedAnswers.length})',
                style: StyleText.size20BoldBlack),
            (Get.width * 0.05).verticalSpace,
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: controller.quizController.questionList.length,
              itemBuilder: (BuildContext context, int index) {
                final QuestionModel question = controller.quizController.questionList[index];
                final String? selectedAnswer = controller.quizController.selectedAnswers[index];
                final bool isCorrect = selectedAnswer == question.correctAnswer;

                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(question.question ?? ''),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${AppStrings.selectedAnsText} ${selectedAnswer ?? AppStrings.notSelectedText}'),
                      Text('${AppStrings.correctAnsText} ${question.correctAnswer}'),
                    ],
                  ),
                  trailing: isCorrect
                      ? Icon(Icons.check, color: AppColors.greenColor)
                      : Icon(Icons.close, color: AppColors.redColor),
                );
              },
            ),
            (Get.width * 0.05).verticalSpace,
            Text('${AppStrings.finalScoreText} ${controller.quizController.score.value}',
                style: StyleText.size18BolBlack),
            (Get.width * 0.1).verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtonWidget(
                    backgroundColor: Colors.teal,
                    isBold: true,
                    height: 35,
                    fontSize: 13,
                    onPressed: controller.onPlayAgainTap,
                    child: Text(AppStrings.playAgainText.toUpperCase())),
                CustomButtonWidget(
                    backgroundColor: Colors.blueGrey,
                    isBold: true,
                    height: 35,
                    fontSize: 13,
                    onPressed: controller.onViewHistoryTap,
                    child: Text(AppStrings.viewHistoryText.toUpperCase())),
              ],
            ),
            (Get.width * 0.05).verticalSpace,
            CustomButtonWidget(
                isBold: true, onPressed: controller.onGoToHomeTap, child: Text(AppStrings.goToHomeText.toUpperCase())),
          ],
        ),
      ),
    );
  }
}
