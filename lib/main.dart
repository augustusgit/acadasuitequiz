import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {'questionText': 'What\'s your favorite colors?', 'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],},
    {'questionText': 'What\'s your favorite animal?', 'answers': [
      {'text':'Rabbit', 'score': 13}, {'text':'Snake', 'score': 18}, {'text':'Elephant', 'score': 21}, {'text':'Lion', 'score': 4}
    ],},
    {'questionText': 'What\'s your favorite instructor?', 'answers': [
      {'text':'Jane', 'score': 14}, {'text':'Max', 'score': 11}, {'text':'John', 'score': 7}, {'text':'Janet', 'score': 9}
    ],},
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });

  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + 1;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Acadasuite Quiz',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Acadasuite Quiz"),
        ),
        body: _questionIndex < _questions.length ?
        Quiz(questions: _questions, answerQuestion: _answerQuestion, questionIndex: _questionIndex)
         : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
