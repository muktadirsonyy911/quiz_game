import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_game/app/modules/quiz/models/quiz_response_model.dart';
import 'package:quiz_game/app/modules/quiz/repo/quiz_api_helper.dart';
import 'package:quiz_game/app/modules/quiz/repo/quiz_api_impl.dart';
import 'package:quiz_game/app/routes/app_pages.dart';

class QuizController extends GetxController {
  RxList<QuestionModel> questionList = <QuestionModel>[].obs;
  RxBool questionDataLoaded = false.obs;

  QuizApiHelper homeApi = QuizApiImpl();

  late PageController pageController;
  RxInt currentPageIndex = 0.obs;
  RxList<String?> selectedAnswers = List<String?>.filled(5, null).obs;
  RxBool showFeedback = false.obs;
  RxInt score = 0.obs;

  final RxInt timerDuration = 30.obs;
  Timer? _timer;

  @override
  void onInit() {
    pageController = PageController();
    getQuestions();
    startTimer();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    resetTimer();
    super.onClose();
  }

  void getQuestions() {
    homeApi.questionsFetch().then((QuizResponseModel responseData) {
      if (responseData.responseCode == 0 && responseData.results != null) {
        questionList.value = responseData.results ?? [];
        questionDataLoaded.value = true;
      }
    });
  }

  void submitAnswer(String? answer) {
    selectedAnswers[currentPageIndex.value] = answer;
    showFeedback.value = true;

    final QuestionModel question = questionList[currentPageIndex.value];
    final String? correctAnswer = question.correctAnswer;

    if (answer == correctAnswer) {
      score.value++; // Increment score for correct answer
    } else {
      if (score.value > 0) {
        score.value--; // Decrement score for incorrect answer (if score > 0)
      }
    }

    Future.delayed(const Duration(seconds: 2), () {
      showFeedback.value = false;
      if (currentPageIndex.value < questionList.length - 1) {
        currentPageIndex.value++;
        pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
        startTimer();
      } else {
        resetTimer();
        Get.offNamed(Routes.result);
      }
    });
  }

  void nextQuestion() {
    if (currentPageIndex.value < 4) {
      currentPageIndex.value++;
      showFeedback.value = false;
      pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
    } else {
      // All questions answered, display results or perform any other actions
      print(selectedAnswers);
    }
  }

  void startTimer() {
    timerDuration.value = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (timerDuration.value <= 0) {
        _timer?.cancel();
        submitAnswer(null);
      } else {
        timerDuration.value--;
      }
    });
  }

  void resetTimer() {
    _timer?.cancel();
    timerDuration.value = 30;
  }
}
