import 'package:quiz_game/app/modules/quiz/models/quiz_response_model.dart';

abstract class QuizApiHelper {
  Future<QuizResponseModel> questionsFetch();
}
