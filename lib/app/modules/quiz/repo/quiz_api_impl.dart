import 'dart:convert';

import 'package:quiz_game/app/commons/utils/response_converter.dart';
import 'package:quiz_game/app/commons/values/api_urls.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_game/app/modules/quiz/models/quiz_response_model.dart';
import 'package:quiz_game/app/modules/quiz/repo/quiz_api_helper.dart';

class QuizApiImpl implements QuizApiHelper {
  @override
  Future<QuizResponseModel> questionsFetch() async {
    final http.Response response = await http.get(Uri.parse(ApiUrls.questionsUrl));
    return ResponseConverter.convert(jsonDecode(response.body), QuizResponseModel.fromJson);
  }
}
