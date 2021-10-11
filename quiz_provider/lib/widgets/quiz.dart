import 'package:flutter/material.dart';
import '/models/answer_model.dart';
import '/models/question_model.dart';

import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<QuestionModel> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    final QuestionModel currentQuestion = questions[questionIndex];
    return Column(
      children: [
        Question(
          currentQuestion.question,
        ),
        ...(currentQuestion.answersList).map(
              (AnswerModel answer) {
            return Answer(
              answerText: answer.text,
              selectHandler: () => answerQuestion(answer.score),
            );
          },
        ).toList()
      ],
    );
  }
}