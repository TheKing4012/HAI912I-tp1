import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizz App',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const QuizzPage(title: 'Flutter Quizz'),
    );
  }
}

class QuizzPage extends StatefulWidget {
  const QuizzPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  final List<Question> _questions = [
    Question(questionText: "Flutter est un framework de Google ?", isCorrect: true),
    Question(questionText: "Flutter utilise Java comme langage principal ?", isCorrect: false),
  ];
  int _currentIndex = 0;
  int _score = 0;

  void _checkAnswer(bool userChoice) {
    if (userChoice == _questions[_currentIndex].isCorrect) {
      setState(() {
        _score++;
      });
    }
    setState(() {
      _currentIndex = (_currentIndex + 1) % _questions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _currentIndex < _questions.length
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _questions[_currentIndex].questionText,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _checkAnswer(true),
                  child: const Text('Vrai'),
                ),
                ElevatedButton(
                  onPressed: () => _checkAnswer(false),
                  child: const Text('Faux'),
                ),
              ],
            ),
          ],
        )
            : Text(
          'Votre score : $_score',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class Question {
  String questionText;
  bool isCorrect;

  Question({required this.questionText, required this.isCorrect});
}
