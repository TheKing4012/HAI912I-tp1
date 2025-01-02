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
      home: const MyHomePage(title: 'TP1 Flutter'),
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
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Row(
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
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Coins arrondis
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
              ),
              child: const Text('Page de Profil'),
            ),
            const SizedBox(width: 16), // Espacement entre les boutons
            ElevatedButton(
              onPressed: () {
                // Naviguer vers la page Quiz
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizzPage(title: 'Questions/Réponses')),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Coins arrondis
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
              ),
              child: const Text('Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
