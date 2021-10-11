import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          height: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://cdn.pixabay.com/photo/2020/03/16/16/29/virus-4937553_960_720.jpg'),
              fit:BoxFit.fitHeight,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            )
          ),
        ),
        Container(
          alignment: Alignment.center,
          //width: 300,
          height: 150,
          margin: EdgeInsets.all(10),
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    )
                ),
              ),

              Container(
                alignment: Alignment.center,
                child: Text(
                  questionText,
                  style: TextStyle(fontSize: 28),
                  textAlign: TextAlign.center,
                ),
              )


            ]
          ),
        ),
      ]
    );
  }
}