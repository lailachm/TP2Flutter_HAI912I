import 'package:flutter/material.dart';
import '/providers/main_provider.dart';
import '/providers/providers.dart';
import '/providers/questions_provider.dart';
import 'package:provider/provider.dart';
import 'widgets/quiz.dart';
import 'widgets/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _TITLE = 'TP2 Flutter Application 1 - COVID quiz';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            title: Text(_TITLE),
            backgroundColor: Colors.blueGrey,
          ),
          body: Consumer2<MainProvider, QuestionsProvider>(
            builder: (BuildContext context, MainProvider mainProvider,
                QuestionsProvider questionsProvider, _) {
              if (mainProvider.questionIndex <
                  questionsProvider.questions.length) {
                return Quiz(
                  answerQuestion: mainProvider.answerQuestion,
                  questionIndex: mainProvider.questionIndex,
                  questions: questionsProvider.questions,
                );
              }
              return Result(mainProvider.totalScore, mainProvider.resetQuiz);
            },
          ),
        ),
      ),
    );
  }
}