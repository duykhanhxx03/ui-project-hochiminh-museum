import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/app.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/review.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ReviewScreen(),
    );
  }
}
