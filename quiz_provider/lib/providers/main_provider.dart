import 'package:flutter/widgets.dart';

class MainProvider with ChangeNotifier {
  // DATA

  int _questionIndex = 0;
  int get questionIndex => _questionIndex;

  int _totalScore = 0;
  int get totalScore => _totalScore;

  // LOGIC

  void resetQuiz() {
    _questionIndex = 0;
    _totalScore = 0;
    notifyListeners();
  }

  void answerQuestion(int score) {
    _totalScore += score;
    _questionIndex = _questionIndex + 1;
    print(score);
    print(_totalScore);
    notifyListeners();
  }
}