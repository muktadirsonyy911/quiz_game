import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_game/app/commons/extensions/extension_num.dart';
import 'package:quiz_game/app/commons/styles/text_style.dart';
import 'package:quiz_game/app/commons/widgets/custom_button_widget.dart';
import 'package:quiz_game/app/modules/quiz/controllers/quiz_controller.dart';
import 'package:quiz_game/app/modules/quiz/models/quiz_response_model.dart';

class QuestionWidget extends StatelessWidget {
  final QuestionModel question;
  final String? selectedAnswer;
  final bool showFeedback;
  final Function(String?) onAnswerSelected;

  const QuestionWidget({
    super.key,
    required this.question,
    required this.selectedAnswer,
    required this.showFeedback,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            question.question ?? '',
            style: StyleText.size16BoldBlack,
          ),
          (Get.width*0.05).verticalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: buildAnswerChoices(),
          ),
          (Get.width*0.05).verticalSpace,
          Text(
            getCorrectAnswer(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: getFeedbackColor(),
            ),
          ),
          (Get.width*0.05).verticalSpace,
          CustomButtonWidget(
            onPressed: selectedAnswer != null || showFeedback
                ? null
                : () {
                    Get.find<QuizController>().resetTimer();
                    onAnswerSelected(selectedAnswer);
                  },
            isBold: true,
            child: Text(showFeedback == true ? 'NEXT' : 'SUBMIT'),
          ),
          (Get.width*0.1).verticalSpace,
          Obx(
            () => Text('Time remaining: 00: 00: ${Get.find<QuizController>().timerDuration.value} seconds'),
          ),
        ],
      ),
    );
  }
  List<Widget> buildAnswerChoices() {
    final List<Widget> answerChoices = [];

    final List<String> choices = [question.correctAnswer ?? '', ...?question.incorrectAnswers];

    choices.shuffle();

    for (String choice in choices) {
      answerChoices.add(
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(choice),
          leading: Radio<String>(
            value: choice,
            groupValue: selectedAnswer,
            onChanged: showFeedback == true ? null : (value) => onAnswerSelected(value),
          ),
        ),
      );
    }

    return answerChoices;
  }

  String getCorrectAnswer() {
    if (showFeedback && selectedAnswer != null) {
      return selectedAnswer == question.correctAnswer ? 'Correct!' : 'Incorrect!';
    }
    return '';
  }

  Color getFeedbackColor() {
    if (showFeedback && selectedAnswer != null) {
      return selectedAnswer == question.correctAnswer ? Colors.green : Colors.red;
    }
    return Colors.transparent;
  }
}
