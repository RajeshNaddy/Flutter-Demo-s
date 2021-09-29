import 'package:flutter/material.dart';
import 'package:my_first_app/quiz.dart';
import './question.dart';
import './answer.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //var questions = ["Whats your fav. color?", "Whats your fav. animal?"];

  static const _question = [
    {
      'questionText': "Whats your fav. color?",
      'answers': [
        {'text': 'Black', 'mark': 10},
        {'text': 'Red', 'mark': 10},
        {'text': 'Blue', 'mark': 10},
        {'text': 'White', 'mark': 10}
      ]
    },
    {
      'questionText': "Whats your fav. animal?",
      'answers': [
        {'text': 'Black', 'mark': 10},
        {'text': 'Red', 'mark': 10},
        {'text': 'Blue', 'mark': 10},
        {'text': 'White', 'mark': 10}
      ]
    },
    {
      'questionText': "Who's your fav. Actor?",
      'answers': [
        {'text': 'Black', 'mark': 10},
        {'text': 'Red', 'mark': 10},
        {'text': 'Blue', 'mark': 10},
        {'text': 'White', 'mark': 10}
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  void _answerQuestion(int score) {
    setState(() {
      print("Answer Chosen");
      _questionIndex++;
    });
    _totalScore = _totalScore + score;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _question.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _question,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore),
      ),
    );
  }
}
