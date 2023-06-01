import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class HistoryModel {
  final String date;
  final int score;

  HistoryModel({required this.date, required this.score});

  HistoryModel.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        score = json['score'] as int;

  Map<String, dynamic> toJson() => {
    'date': date,
    'score': score,
  };
}

class ScoreStorage {
  static const String scoresKey = 'scores';
  static final ScoreStorage _instance = ScoreStorage._internal();
  SharedPreferences? _prefs;

  factory ScoreStorage() {
    return _instance;
  }

  ScoreStorage._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  List<HistoryModel> getScores() {
    final String? scoresJson = _prefs?.getString(scoresKey);
    if (scoresJson != null) {
      final List scoresData = json.decode(scoresJson);
      return scoresData.map((json) => HistoryModel.fromJson(json)).toList();
    }
    return [];
  }

  Future<void> addScore({required HistoryModel scoreEntry}) async {
    final List<HistoryModel> scores = getScores();
    scores.add(scoreEntry);
    final String scoresJson = json.encode(scores.map((entry) => entry.toJson()).toList());
    await _prefs?.setString(scoresKey, scoresJson);
  }
}
