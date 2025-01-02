import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizz App',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const QuizzPage(title: 'Questions/Réponses'),
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
    Question(
      questionText: "La France a dû céder l'Alsace et la Moselle à l'Allemagne après 1870.",
      isCorrect: true,
      imagePath: 'assets/france.jpg', // Image associée
    ),
    Question(
      questionText: "Flutter utilise Java comme langage principal.",
      isCorrect: false,
      imagePath: null, // Pas d'image associée
    ),
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
    final currentQuestion = _questions[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Affiche l'image si elle est disponible
            if (currentQuestion.imagePath != null)
              Image.asset(
                currentQuestion.imagePath!,
                height: 150,
                fit: BoxFit.contain,
              ),
            if (currentQuestion.imagePath != null) const SizedBox(height: 20),
            // Affiche la question dans une carte
            Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  currentQuestion.questionText,
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Boutons pour répondre
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _checkAnswer(true),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  child: const Text('VRAI'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => _checkAnswer(false),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  child: const Text('FAUX'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentIndex = (_currentIndex + 1) % _questions.length;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(16),
                  ),
                  child: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Score affiché en bas
            if (_currentIndex == _questions.length - 1)
              Text(
                'Votre score : $_score/${_questions.length}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}

class Question {
  String questionText;
  bool isCorrect;
  String? imagePath;

  Question({required this.questionText, required this.isCorrect, this.imagePath});
}
