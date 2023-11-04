import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/data/test_exam_data.dart';
import 'package:ui_project_hochiminh_museum/screens/quiz/test.dart';
import '../../widgets/quiz_category_item.dart';
import '../../widgets/quiz_category_item_child.dart';

class QuizHome extends StatelessWidget {
  const QuizHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: ListView(
        children: [
          QuizCategoryItem(
            title: 'Đề thi',
            child: [
              QuizCategoryItemChild(
                route: TestExamScreen(questions: TestExamData.questionsList1),
                title: 'Đề thi 1',
              ),
              QuizCategoryItemChild(
                route: TestExamScreen(questions: TestExamData.questionsList2),
                title: 'Đề thi 2',
              ),
            ],
          ),
          const QuizCategoryItem(
            title: 'Ôn tập',
            child: [],
          ),
        ],
      ),
    );
  }
}
