import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

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
  final questions = const [
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
    if(_questionIndex < questions.length){

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
        body: _questionIndex < questions.length ? Column(
          children: <Widget>[
            Question(questions[_questionIndex]['questionText']),
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion,answer);
            }).toList()
          ],
        ) : Center(child: Text('You Did it'),),
      ),
    );
  }
}
