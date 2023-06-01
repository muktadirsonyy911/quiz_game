import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_game/app/commons/extensions/extension_num.dart';
import 'package:quiz_game/app/commons/styles/text_style.dart';
import 'package:quiz_game/app/commons/values/app_colors.dart';
import 'package:quiz_game/app/commons/widgets/app_bar_widget.dart';
import 'package:quiz_game/app/commons/widgets/custom_button_widget.dart';
import 'package:quiz_game/app/modules/quiz/models/quiz_response_model.dart';
import 'package:quiz_game/app/modules/result/controllers/result_controller.dart';

class ResultView extends GetView<ResultController> {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(viewName: 'Result'),
      body: Container(
        padding: 15.allPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('(${controller.totalCorrectAnswers} out of ${controller.quizController.selectedAnswers.length})',
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
                      Text('Selected Answer: ${selectedAnswer??'Not selected'}'),
                      Text('Correct Answer: ${question.correctAnswer}'),
                    ],
                  ),
                  trailing: isCorrect
                      ? const Icon(Icons.check, color: Colors.green)
                      : const Icon(Icons.close, color: Colors.red),
                );
              },
            ),
            (Get.width * 0.05).verticalSpace,
            Text('Your final score is: ${controller.quizController.score.value}', style: StyleText.size18BolBlack),
            (Get.width * 0.1).verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtonWidget(
                  backgroundColor: Colors.teal,
                    isBold: true, onPressed: controller.onPlayAgainTap, child: Row(
                      children: [
                        Icon(Icons.replay_5, color:AppColors.whiteColor,),
                        (Get.width*0.03).horizontalSpace,
                        const Text('PLAY AGAIN'),
                        (Get.width*0.03).horizontalSpace,
                      ],
                    )),
                CustomButtonWidget(
                  backgroundColor: Colors.blueGrey,
                    isBold: true, onPressed: controller.onViewHistoryTap, child: Row(
                  children: [
                    Icon(Icons.history, color:AppColors.whiteColor,),
                    (Get.width*0.03).horizontalSpace,
                    const Text('VIEW HISTORY'),
                    (Get.width*0.03).horizontalSpace,
                  ],
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
