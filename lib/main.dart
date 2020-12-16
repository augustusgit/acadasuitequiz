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
      'Black', 'Red', 'Green', 'White'
    ],},
    {'questionText': 'What\'s your favorite animal?', 'answers': [
      'Rabbit', 'snake', 'Elephant', 'lion'
    ],},
    {'questionText': 'What\'s your favorite instructor?', 'answers': [
      'Jane', 'Max', 'John', 'Janet'
    ],},
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
    if(_questionIndex < _questions.length){

    }
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
         : Result(),
      ),
    );
  }
}
