import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/features/main/models/test_exam_model.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'models/test_exam_question.dart';

class RevisionScreen extends StatefulWidget {
  const RevisionScreen({super.key, required this.questions, required});

  final List<TestExamModel> questions;

  @override
  State<RevisionScreen> createState() => _RevisionScreenState();
}

class _RevisionScreenState extends State<RevisionScreen> {
  late List<TestExamModel> questions;
  late List<int> selectedAnswers;
  late TestExamModel selectedQuestion;
  late int indexQuestion;
  late int numCorrect;
  late int numIncorrect;

  @override
  void initState() {
    super.initState();
    questions = widget.questions;
    indexQuestion = 3;
    selectedQuestion = questions[0];
    numCorrect = 0;
    numIncorrect = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Câu hỏi ôn tập',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: TColors.primary,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                  child: Card(
                color: TColors.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100.0,
                    ),
                    Text(selectedQuestion.question,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28)),
                    const SizedBox(
                      height: 20,
                    ),
                    // for (int i = 0; i < selectedQuestion.options.length; i++)

                    //   ,
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              )),
              const SizedBox(height: 32),
              Container(
                child: Column(
                  children: [
                    Text("Số câu hỏi đúng: $numCorrect"),
                    Text("Số câu hỏi sai: $numIncorrect"),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
