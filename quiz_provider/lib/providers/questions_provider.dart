import 'package:flutter/widgets.dart';
import '/models/answer_model.dart';
import '/models/question_model.dart';

class QuestionsProvider with ChangeNotifier {
  final List<QuestionModel> _questions = [
    QuestionModel(
      question: 'Faut-il respecter une distance de 1 mètre?',
      answersList: [
        AnswerModel(text: 'Vrai', score: 10),
        AnswerModel(text: 'Faux', score: 0),
        AnswerModel(text: 'Passer', score: 0),
      ],
    ),
    QuestionModel(
      question: 'Est-ce que le COVID peut se propager dans l\'air?',
      answersList: [
        AnswerModel(text: 'Vrai', score: 10),
        AnswerModel(text: 'Faux', score: 0),
        AnswerModel(text: 'Passer', score: 0),
      ],
    ),
    QuestionModel(
      question: 'Peut-on serrer la main de ses collègues?',
      answersList: [
        AnswerModel(text: 'Vrai', score: 0),
        AnswerModel(text: 'Faux', score: 10),
        AnswerModel(text: 'Passer', score: 0),
      ],
    ),
  ];
  List<QuestionModel> get questions => _questions;
}