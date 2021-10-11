import 'package:flutter/material.dart';
import 'answer_model.dart';

class QuestionModel {
  final String question;
  final List<AnswerModel> answersList;
  const QuestionModel({
    required this.answersList,
    required this.question,
  });
}