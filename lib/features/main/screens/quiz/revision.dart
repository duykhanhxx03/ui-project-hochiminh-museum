import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/features/main/models/test_exam_model.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/revision_screen/questions_screen.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/revision_screen/result_screen.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';

class RevisionScreen extends StatefulWidget {
  const RevisionScreen({super.key, required this.questions});
  final List<TestExamModel> questions;

  @override
  State<RevisionScreen> createState() {
    return _RevisionScreenState();
  }
}

class _RevisionScreenState extends State<RevisionScreen> {
  late List<TestExamModel> questions = widget.questions;
  List<String> selectedAnswers = [];

  String activeScreen = 'questions-screen';

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restart() {
    setState(() {
      activeScreen = 'questions-screen';
      selectedAnswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = QuestionsScreen(
      questions: questions,
      onSelectAnswer: chooseAnswer,
    );

    if (activeScreen == 'results-screen') {
      screenWidget = ResultScreen(
        choosenAnswers: selectedAnswers,
        restart: restart,
        questions: questions,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ôn tập',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: TColors.primary,
      ),
      body: screenWidget,
    );
  }
}
