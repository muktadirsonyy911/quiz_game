import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:quiz_game/app/commons/extensions/extension_num.dart';
import 'package:quiz_game/app/commons/values/app_colors.dart';
import 'package:quiz_game/app/commons/values/app_strings.dart';
import 'package:quiz_game/app/commons/widgets/app_bar_widget.dart';
import 'package:quiz_game/app/modules/quiz/models/quiz_response_model.dart';
import 'package:quiz_game/app/modules/quiz/widgets/question_widget.dart';

import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(viewName: AppStrings.quizText),
      body: Obx(() {
        if (controller.questionDataLoaded.value == false) {
          return Center(
              child: SpinKitDoubleBounce(
            color: AppColors.primaryColor,
            size: 50,
          ));
        } else if (controller.questionDataLoaded.value == true && controller.questionList.isEmpty) {
          return  Center(child: Text(AppStrings.noQuestionFoundText));
        } else {
          return Column(
            children: [
              Expanded(
                flex: 5,
                child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
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
                    }),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 30,
                  padding: EdgeInsets.only(left: Get.width*0.5, right: Get.width*0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < controller.questionList.length; i++)
                        Container(
                          width: 20.0,
                          height: 20.0,
                          margin: 5.horizontalPadding,
                          decoration: BoxDecoration(
                            borderRadius: 5.circularRadius,
                            color: i == controller.currentPageIndex.value
                                ? AppColors.primaryColor
                                : Colors.grey,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
