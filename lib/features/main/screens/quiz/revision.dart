import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/features/main/models/test_exam_model.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/revision_screen/questions_screen.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/revision_screen/result_screen.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/revision_screen/start_screen.dart';

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

  String activeScreen = 'start-screen';
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

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
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        questions: questions,
        onSelectAnswer: chooseAnswer,
      );
    }

    // if (activeScreen == 'results-screen') {
    //   screenWidget = ResultScreen(
    //     choosenAnswers: selectedAnswers,
    //     restart: restart,
    //   );
    // }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 87, 27, 189),
                Color.fromARGB(255, 129, 61, 246)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
