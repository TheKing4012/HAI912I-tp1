import 'package:flutter/material.dart';
import 'widget/profile_card_page.dart'; // Import de la page ProfileCard
import 'widget/quiz_page.dart';        // Import de la page Quiz

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exercises',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Exercises'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Naviguer vers la page Profile Card
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileHomePage()),
                );
              },
              child: const Text('Go to Profile Card'),
            ),
            ElevatedButton(
              onPressed: () {
                // Naviguer vers la page Quiz
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizzPage(title: 'Flutter Quizz')),
                );
              },
              child: const Text('Go to Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
