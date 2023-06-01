import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:quiz_game/app/commons/values/app_colors.dart';
import 'package:quiz_game/app/commons/widgets/app_bar_widget.dart';
import 'package:quiz_game/app/modules/quiz/models/quiz_response_model.dart';
import 'package:quiz_game/app/modules/quiz/widgets/question_widget.dart';

import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(viewName: 'Quiz'),
      body: Obx(() {
        if (controller.questionDataLoaded.value == false) {
          return Center(
              child: SpinKitDoubleBounce(
            color: AppColors.primaryColor,
            size: 50,
          ));
        } else if (controller.questionDataLoaded.value == true && controller.questionList.isEmpty) {
          return const Center(child: Text('No question found'));
        } else {
          return PageView.builder(
              controller: controller.pageController,
              itemCount: controller.questionList.length,
              itemBuilder: (BuildContext context, int index) {
                final QuestionModel question = controller.questionList[index];
                return Obx(() => QuestionWidget(
                      question: question,
                      selectedAnswer: controller.selectedAnswers[index],
                      showFeedback: controller.showFeedback.value,
                      onAnswerSelected: (answer) => controller.submitAnswer(answer),
                    ));
              });
        }
      }),
    );
  }
}
