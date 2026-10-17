import 'package:flutter/material.dart';
import 'screen/quizz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const background = Color(0xFF0D1426);

    return MaterialApp(
      title: 'Quizzler',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8275FF),
          brightness: Brightness.dark,
          surface: const Color(0xFF182238),
        ),
      ),
      home: const QuizScreen(),
    );
  }
}
