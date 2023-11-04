import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/screens/quiz/quiz_home.dart';
import 'package:ui_project_hochiminh_museum/screens/quiz/test.dart';

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
      home: TestExamScreen(),
    );
  }
}
