import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer({
    required this.selectHandler,
    required this.answerText,
  }) : assert(selectHandler != null && answerText != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: double.infinity,
      padding: EdgeInsets.all(5.0),
      child: RaisedButton(
        color: Colors.blueGrey,
        textColor: Colors.black,
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}