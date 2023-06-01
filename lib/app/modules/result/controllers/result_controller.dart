import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quiz_game/app/commons/services/score_storage.dart';
import 'package:quiz_game/app/modules/quiz/controllers/quiz_controller.dart';
import 'package:quiz_game/app/modules/quiz/models/quiz_response_model.dart';
import 'package:quiz_game/app/routes/app_pages.dart';

class ResultController extends GetxController {
  final QuizController quizController = Get.find<QuizController>();
  RxInt totalCorrectAnswers = 0.obs;
  RxInt totalIncorrectAnswers = 0.obs;

  ScoreStorage scoreStorage = ScoreStorage();

  @override
  void onInit() {
    calculateCorrectAnswers();
    calculateIncorrectAnswers();
    addScoreData();
    super.onInit();
  }

  void calculateCorrectAnswers() {
    int correctCount = 0;
    for (int i = 0; i < quizController.questionList.length; i++) {
      final QuestionModel question = quizController.questionList[i];
      final String? selectedAnswer = quizController.selectedAnswers[i];
      if (selectedAnswer == question.correctAnswer) {
        correctCount++;
      }
    }
    totalCorrectAnswers.value = correctCount;
  }

  void calculateIncorrectAnswers() {
    totalIncorrectAnswers.value = quizController.questionList.length - totalCorrectAnswers.value;
  }

  void addScoreData() async {
    DateTime now = DateTime.now();
    String currentDate = DateFormat().format(now);
    int currentScore = quizController.score.value; // Replace with the actual score value
    HistoryModel history = HistoryModel(date: currentDate, score: currentScore);
    await scoreStorage.addScore(scoreEntry: history);
  }

  void onGoToHomeTap() {
    Get.offAllNamed(Routes.home);
  }

  void onViewHistoryTap() {
    Get.offAllNamed(Routes.history);
  }

  void onPlayAgainTap() {
    Get.offAllNamed(Routes.quiz);
  }
}
