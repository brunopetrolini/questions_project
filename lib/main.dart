import 'package:flutter/material.dart';

import './widgets/results.dart';
import './widgets/questions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Questions Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedQuestion = 0;
  int _overallScore = 0;

  final List<Map<String, Object>> _questions = [
    {
      'text': 'Qual é a sua cor favorita?',
      'answers': [
        {'value': 'Vermelho', 'score': 10},
        {'value': 'Azul', 'score': 5},
        {'value': 'Verde', 'score': 3},
        {'value': 'Roxo', 'score': 1},
      ]
    },
    {
      'text': 'Qual é o seu animal favorito?',
      'answers': [
        {'value': 'Coelho', 'score': 10},
        {'value': 'Cobra', 'score': 5},
        {'value': 'Elefante', 'score': 3},
        {'value': 'Leão', 'score': 1},
      ]
    },
    {
      'text': 'Qual é o seu instrutor favorito?',
      'answers': [
        {'value': 'Daniel', 'score': 1},
        {'value': 'Angela', 'score': 5},
        {'value': 'Jamilton', 'score': 3},
        {'value': 'Léo', 'score': 10},
      ]
    }
  ];

  void _onAnswer(int score) {
    if (_validSelectedQuestion)
      setState(() {
        _selectedQuestion++;
        _overallScore += score;
      });
  }

  void _restartQuestions() {
    setState(() {
      _selectedQuestion = 0;
      _overallScore = 0;
    });
  }

  bool get _validSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        title: Text(
          'Perguntas',
          style: TextStyle(
            color: const Color(0xff000000),
          ),
        ),
        elevation: 0,
        backgroundColor: const Color(0xffffffff),
        centerTitle: true,
        bottom: PreferredSize(
            child: Container(
              height: 1.5,
              color: const Color(0xfff6f6f6),
            ),
            preferredSize: null),
      ),
      body: _validSelectedQuestion
          ? Questions(
              questions: _questions,
              onAnswer: _onAnswer,
              selectedQuestion: _selectedQuestion,
            )
          : Results(score: _overallScore, onFinish: _restartQuestions),
    );
  }
}
