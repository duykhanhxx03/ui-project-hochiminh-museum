import 'package:flutter/material.dart';
// import 'package:ui_project_hochiminh_museum/models/quiz_question.dart';
import 'package:ui_project_hochiminh_museum/screens/quiz/review.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ho Chi Minh Museum',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ReviewScreen(),
    );
  }
}
