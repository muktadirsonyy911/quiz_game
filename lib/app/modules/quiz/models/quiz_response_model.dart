class QuizResponseModel {
  int? responseCode;
  List<QuestionModel>? results;

  QuizResponseModel({this.responseCode, this.results});

  QuizResponseModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    if (json['results'] != null) {
      results = <QuestionModel>[];
      json['results'].forEach((v) {
        results!.add(QuestionModel.fromJson(v));
      });
    }
  }
}

class QuestionModel {
  String? category;
  String? type;
  String? difficulty;
  String? question;
  String? correctAnswer;
  List<String>? incorrectAnswers;

  QuestionModel({this.category, this.type, this.difficulty, this.question, this.correctAnswer, this.incorrectAnswers});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    type = json['type'];
    difficulty = json['difficulty'];
    question = json['question'];
    correctAnswer = json['correct_answer'];
    incorrectAnswers = json['incorrect_answers'].cast<String>();
  }
}
